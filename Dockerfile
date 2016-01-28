FROM postgres:9.4
MAINTAINER Camptocamp "info@camptocamp.com"

RUN apt-get update && apt-get install -y postgresql-9.4-postgis-2.1 && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD 00-postgis.sql /docker-entrypoint-initdb.d/
