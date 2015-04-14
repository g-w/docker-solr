FROM phusion/baseimage:0.9.16

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y openjdk-7-jre-headless && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV SOLR_VERSION 4.9.1
ENV SOLR solr-$SOLR_VERSION

RUN curl --retry 3 http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz | tar -C /opt --extract --gzip
RUN mv /opt/$SOLR /opt/solr

RUN useradd --home-dir /opt/solr --comment "Solr Server" solr
RUN chown -R solr:solr /opt/solr/example

RUN mkdir -p /etc/service/solr
ADD deploy/run/solr.sh /etc/service/solr/run

EXPOSE 8983
WORKDIR /opt/solr/example
