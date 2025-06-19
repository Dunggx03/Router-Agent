#include "dns_capture.h"
#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Use: %s <interface> <server_url>\n", argv[0]);
        return 1;
    }

    const char *interface = argv[1];
    const char *server_url = argv[2];
    start_dns_capture(interface, server_url);

    return 0;
}
