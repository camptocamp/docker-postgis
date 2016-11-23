FROM postgres:9.5
MAINTAINER Camptocamp "info@camptocamp.com"

RUN apt-get update \
  && apt-get install --no-install-recommends -y postgresql-9.5-postgis-2.2 postgresql-9.5-postgis-2.2-scripts \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY 00-postgis.sql /docker-entrypoint-initdb.d/
