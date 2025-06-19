#ifndef DNS_UTILS_H
#define DNS_UTILS_H

int decode_domain_name(const unsigned char *payload, int offset, char *output);
void to_lowercase(char *str);

#endif
