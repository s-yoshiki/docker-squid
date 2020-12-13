FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh

RUN chmod 777 /entrypoint.sh

RUN apk add --no-cache squid &&\
    mkdir -p /etc/squid/conf.d &&\
    cp /etc/squid/squid.conf /etc/squid/conf.d/default.conf &&\
    echo 'include /etc/squid/conf.d/*.conf' > /etc/squid/squid.conf &&\
    echo 'logfile_rotate 0' >> /etc/squid/conf.d/log.conf &&\
    echo 'cache_store_log none' >> /etc/squid/conf.d/log.conf &&\
    echo 'access_log stdio:/proc/self/fd/1 combined' >> /etc/squid/conf.d/log.conf &&\
    echo 'cache_log stdio:/proc/self/fd/2' >> /etc/squid/conf.d/log.conf &&\
    echo 'coredump_dir /dev/null' >> /etc/squid/conf.d/log.conf &&\
    echo 'pid_filename /var/run/squid/squid.pid' >> /etc/squid/conf.d/log.conf

RUN install -d -o squid -g squid \
    /var/cache/squid \
    /var/log/squid \
    /var/run/squid && \
    chmod +x /usr/lib/squid/*

EXPOSE 3128
USER squid
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/sbin/init"]