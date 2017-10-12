FROM alpine:3.6

RUN apk --no-cache --update add openssl
RUN wget -q -O /usr/local/bin/gosu $(wget -q -O - https://api.github.com/repos/tianon/gosu/releases/latest | grep 'browser_' | cut -d\" -f4|grep "/gosu-amd64$") && chmod +x /usr/local/bin/gosu
RUN apk --no-cache del openssl
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
