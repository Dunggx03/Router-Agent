#include "dns_capture.h"
#include "dns_utils.h"
#include "http_client.h"

#include <stdio.h>
#include <pcap.h>
#include <netinet/ip.h>
#include <netinet/udp.h>
#include <arpa/inet.h>
#include <string.h>

#define DNS_PORT 53

static const char *g_server_url = NULL;

void dns_packet_handler(u_char *args, const struct pcap_pkthdr *header, const u_char *packet) {
    printf(" DNS Packet received - len: %d bytes\n", header->len);

    struct ip *ip_hdr = (struct ip *)(packet + 14);
    if (ip_hdr->ip_p != IPPROTO_UDP) return;

    struct udphdr *udp_hdr = (struct udphdr *)(packet + 14 + ip_hdr->ip_hl * 4);
    const u_char *dns_payload = packet + 14 + ip_hdr->ip_hl * 4 + sizeof(struct udphdr);

    uint16_t dns_flags = ntohs(*(uint16_t *)(dns_payload + 2));
    //printf("DNS Flags: 0x%x (%s)\n", dns_flags, (dns_flags & 0x8000) ? "Response" : "Request");
    // Bỏ dòng dưới nếu muốn bắt cả request
    if (!(dns_flags & 0x8000)) return;

    char domain[256];
    if (decode_domain_name(dns_payload, 12, domain) < 0) {
        printf("Failed to decode domain\n");
        return;
    }

    to_lowercase(domain);
    printf(" Domain parsed: %s\n", domain);

    int offset = 12;
    int qdcount = ntohs(*(uint16_t *)(dns_payload + 4));
    int ancount = ntohs(*(uint16_t *)(dns_payload + 6));

    //printf("qdcount: %d, ancount: %d\n", qdcount, ancount);

    for (int i = 0; i < qdcount; i++) {
        while (dns_payload[offset] != 0) {
            if ((dns_payload[offset] & 0xC0) == 0xC0) { offset += 2; break; }
            offset += dns_payload[offset] + 1;
        }
        offset += 5;
    }

    //printf("Offset after QD: %d\n", offset);

    for (int i = 0; i < ancount; i++) {
        if ((dns_payload[offset] & 0xC0) == 0xC0)
            offset += 2;
        else {
            while (dns_payload[offset] != 0)
                offset += dns_payload[offset] + 1;
            offset++;
        }

        uint16_t type = ntohs(*(uint16_t *)(dns_payload + offset));
        offset += 8;  // type(2) + class(2) + ttl(4)
        uint16_t rdlen = ntohs(*(uint16_t *)(dns_payload + offset));
        offset += 2;

        //printf("Answer type: %d, rdlen: %d\n", type, rdlen);

        if (type == 1 && rdlen == 4) {
            char ip_str[INET_ADDRSTRLEN];
            inet_ntop(AF_INET, dns_payload + offset, ip_str, sizeof(ip_str));
            printf("domain: %s - %s \n", domain, ip_str);
            send_dns_info_to_server(g_server_url, domain, ip_str);
        }

        offset += rdlen;
    }
}


void start_dns_capture(const char *interface_name, const char *server_url) {
    g_server_url = server_url;
    char errbuf[PCAP_ERRBUF_SIZE];
    pcap_t *handle = pcap_open_live(interface_name, BUFSIZ, 1, 1000, errbuf);
    if (!handle) {
        fprintf(stderr, "cant open interface %s: %s \n", interface_name, errbuf);
        return;
    }
    struct bpf_program filter;
    if (pcap_compile(handle, &filter, "udp port 53", 0, PCAP_NETMASK_UNKNOWN) == -1 ||
        pcap_setfilter(handle, &filter) == -1) {
            fprintf(stderr, "cant set up BPF filteṛ\n");
            pcap_close(handle);
            return;
        }
    printf("listening DNS at interface %s \n", interface_name);
    pcap_loop(handle, 0, dns_packet_handler, NULL);
    
    pcap_close(handle);
}