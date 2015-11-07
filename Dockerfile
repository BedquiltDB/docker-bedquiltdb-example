FROM ubuntu
MAINTAINER Shane Kilkelly <shane@kilkelly.me>


# Exposes
EXPOSE 5432


# Credentials
ENV USERNAME docker
ENV PASS docker


RUN apt-key adv --keyserver keyserver.ubuntu.com \
  --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

RUN echo \
  "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
  > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update


RUN apt-get -y -q install \
  postgresql-9.4 \
  postgresql-server-dev-9.4 \
  postgresql-client-9.4 \
  postgresql-contrib-9.4 \
  make


ADD pg_hba.conf     /etc/postgresql/9.4/main/
ADD pg_ident.conf   /etc/postgresql/9.4/main/
ADD postgresql.conf /etc/postgresql/9.4/main/

ADD bedquilt-package /tmp/bedquilt-package

RUN cd /tmp/bedquilt-package && make install


# main entry
ADD start /start
RUN chmod 0755 /start


CMD ["/start"]
