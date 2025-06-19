#include "http_client.h"
#include <stdio.h>
#include <curl/curl.h>

void send_dns_info_to_server(const char *url, const char *domain, const char *ip) {
    CURL *curl = curl_easy_init();
    if (!curl) return;

    char json[512];
    snprintf(json, sizeof(json), "{\"domain\": \"%s\", \"ip\": \"%s\"}", domain, ip);

    struct curl_slist *headers = NULL;
    headers = curl_slist_append(headers, "Content-Type: application/json");

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, json);
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 3L);
    //curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);  // optional for self-signed

    CURLcode res = curl_easy_perform(curl);
    if (res != CURLE_OK)
        fprintf(stderr, "CURL error : %s\n", curl_easy_strerror(res));

    curl_slist_free_all(headers);
    curl_easy_cleanup(curl);
}
