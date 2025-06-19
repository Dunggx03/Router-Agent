#include "dns_utils.h"
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int decode_domain_name(const unsigned char *payload, int offset, char *output) {
    int len = payload[offset++];
    int i = 0;

    while (len > 0 && offset < 512) {
        for (int j = 0; j < len; j++)
            output[i++] = payload[offset++];
        output[i++] = '.';
        len = payload[offset++];
    }

    if (i == 0) return -1;
    output[i - 1] = '\0';
    return 0;
}

void to_lowercase(char *str) {
    for (int i = 0; str[i]; i++)
        str[i] = tolower(str[i]);
}
