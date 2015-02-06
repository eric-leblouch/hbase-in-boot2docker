#!/bin/bash
IP=`ip addr show eth0 | grep 'inet ' | cut -d/ -f1 | awk '{print $2}'`

sed -i "s/###DOCKER_IP###/$IP/g" hbase/conf/hbase-site.xml

sed -i "s/###DOCKER_IP###/$IP/g" hbase/conf/zoo.cfg

echo "$IP $HOSTNAME" >> /etc/hosts

hbase/bin/start-hbase.sh && tail -F /hbase/logs/hbase--master-$HOSTNAME.log
