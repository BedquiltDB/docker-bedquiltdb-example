FROM ubuntu:16.04
MAINTAINER Shane Kilkelly <shane@kilkelly.me>


# Exposes
EXPOSE 5432


# Credentials
ENV USERNAME docker
ENV PASS docker


RUN apt-get update && apt-get upgrade


RUN apt-get update && apt-get -y -q install \
  postgresql-9.5 \
  postgresql-server-dev-9.5 \
  postgresql-client-9.5 \
  postgresql-contrib-9.5 \
  postgresql-plpython3-9.5 \
  build-essential


ADD pg_hba.conf     /etc/postgresql/9.5/main/
ADD pg_ident.conf   /etc/postgresql/9.5/main/
ADD postgresql.conf /etc/postgresql/9.5/main/


ADD bedquilt-package /tmp/bedquilt-package


RUN cd /tmp/bedquilt-package && make install


# main entry
ADD start /start
RUN chmod 0755 /start


CMD ["/start"]
