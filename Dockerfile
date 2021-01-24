FROM alpine:latest

RUN apk add --no-cache curl gettext moreutils \
    && rm -rf /var/lib/apt/lists/*

COPY cron-run /root/cron-run
RUN chmod 640 /root/cron-run
RUN crontab /root/cron-run

COPY docker-entrypoint.sh ./
ENTRYPOINT [ "sh", "docker-entrypoint.sh" ]

CMD [ "/usr/sbin/crond", "-f"]