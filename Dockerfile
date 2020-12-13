FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh

RUN chmod 777 /entrypoint.sh

RUN apk add --no-cache squid && \
    mkdir -p /etc/squid/conf.d && \
    echo 'include /etc/squid/conf.d/*.conf' > /etc/squid/squid.conf

RUN install -d -o squid -g squid \
		/var/cache/squid \
		/var/log/squid \
		/var/run/squid && \
	chmod +x /usr/lib/squid/*

EXPOSE 3128
USER squid
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/sbin/init"]