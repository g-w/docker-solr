#!/bin/sh

cd /data/solr
set -ex
exec /sbin/setuser solr /usr/bin/java -jar start.jar
