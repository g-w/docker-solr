#!/bin/sh

cd /opt/solr/example
set -ex
exec /sbin/setuser solr /usr/bin/java -jar start.jar
