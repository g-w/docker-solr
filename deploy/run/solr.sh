#!/bin/sh

cd /data/solr
chown -R solr:solr /data/solr
set -ex
exec /sbin/setuser solr /usr/bin/java -jar start.jar
