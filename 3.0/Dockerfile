FROM debian:wheezy

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates curl \
    python-pip python-dev build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" > /etc/apt/sources.list.d/mongodb-org.list

RUN groupadd -r mongodb && useradd -r -g mongodb mongodb

RUN set -x \
  && apt-get update \
  && apt-get install -y mongodb-org=3.0.2 \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/lib/mongodb

RUN pip install pymongo==2.8 mtools

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /data

ENTRYPOINT ["/entrypoint.sh"]
CMD mlaunch