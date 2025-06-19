CC = gcc
CFLAGS = -Wall -O2
LIBS = -lpcap -lcurl

OBJS = main.o dns_capture.o dns_utils.o http_client.o

all: dns_agent

dns_agent: $(OBJS)
	$(CC) -o $@ $^ $(LIBS)

clean:
	rm -f *.o dns_agent
