FROM postgres:9.4
MAINTAINER Camptocamp "info@camptocamp.com"

RUN apt-get update \
  && apt-get install --no-install-recommends -y postgresql-9.4-postgis-2.1 postgresql-9.4-postgis-scripts=2.1.4+dfsg-3 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY 00-postgis.sql /docker-entrypoint-initdb.d/
