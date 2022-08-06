FROM alpine AS builder

LABEL org.opencontainers.image.documentation="https://github.com/itning/smartdns/blob/main/README.md"
LABEL org.opencontainers.image.authors="itning@itning.top"
LABEL org.opencontainers.image.source="https://github.com/itning/smartdns"
LABEL org.opencontainers.image.title="smartdns"
LABEL org.opencontainers.image.description="A local DNS server to obtain the fastest website IP for the best Internet experience， 一个本地DNS服务器，获取最快的网站IP，获得最佳上网体验。"
LABEL org.opencontainers.image.licenses="GPL-3.0"

COPY smartdns.tar.gz /

RUN tar zxvf smartdns.tar.gz

FROM alpine

COPY --from=builder /smartdns/usr/sbin/smartdns /bin/smartdns

RUN chmod +x /bin/smartdns

EXPOSE 53

ENTRYPOINT ["/bin/smartdns", "-f","-x","-c","/smartdns/smartdns.conf"]
