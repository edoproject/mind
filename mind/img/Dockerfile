ARG VERSION_BASE
ARG DOCKER_REPOSITORY

FROM ${DOCKER_REPOSITORY}/mind_base:${VERSION_BASE}
MAINTAINER xgrzsza <grzegorz.szadkowski@gmail.com>
LABEL Description="Mind map DB connector and Tree Finder base"

ENV PATH=/mind:$PATH \
    PYTONPATH=/mind

ADD mind.tar /mind

# Copy cron based hourly cleanup script
COPY files/cleaner /etc/periodic/hourly/cleaner
COPY files/entrypoint.sh /bin/entrypoint.sh

RUN chmod a+x \
        /bin/entrypoint.sh \
        /etc/periodic/hourly/* \
        /logs \
        /workspace

WORKDIR /workspace
ENTRYPOINT ["/bin/entrypoint.sh"]
