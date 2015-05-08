FROM debian:wheezy

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates curl \
    python-pip python-dev build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list 

RUN groupadd -r mongodb && useradd -r -g mongodb mongodb

RUN set -x \
  && apt-get update \
  && apt-get install -y mongodb-10gen=2.4.14 \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/lib/mongodb

RUN pip install pymongo==2.8 mtools

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /data

ENTRYPOINT ["/entrypoint.sh"]
CMD mlaunch
