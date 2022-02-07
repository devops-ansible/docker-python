ARG IMAGE=python
ARG VERSION=latest

FROM $IMAGE:$VERSION

MAINTAINER macwinnie <dev@macwinnie.me>

ENV CNT_TIMEZONE "Europe/Berlin"
ENV CNT_LOCALE   "de_DE.UTF-8"
ENV START_CRON   0
ENV CRON_PATH    "/etc/cron.d/docker"

# copy all relevant files
COPY files/ /

# organise file permissions and run installer
RUN chmod a+x /install.sh && \
    /install.sh && \
    rm -f /install.sh

# run on every (re)start of container
ENTRYPOINT [ "entrypoint" ]
CMD [ "_start" ]
