#!/bin/bash
set -e

DIR="$( cd "$( dirname "$0" )" && pwd )"
APPS=${APPS:-$HOME/workspace}
HOSTS=/etc/hosts

boot2dockerip(){
  boot2docker ip 2> /dev/null
}

boot2dockerup(){
  ignore=$(boot2docker up 2> /dev/null)
}

boot2dockershellinit(){
  boot2docker shellinit 2> /dev/null | tail -3
}

up() {
  boot2dockerup
  # Use $(up) to initialize docker env
  echo $(boot2dockershellinit)
}

killz(){
	$(boot2dockershellinit)
	echo "Killing hbase docker container:"
	dockerps=$(docker ps | grep 'ubeeko/standalonehbase')
        echo $dockerps
	ids=$(echo $dockerps |cut -d ' ' -f 1)
	echo $ids | xargs docker kill
	echo $ids | xargs docker rm
}

stop(){
	$(boot2dockershellinit)
	echo "Stopping hbase docker container:"
	dockerps=$(docker ps | grep 'ubeeko/standalonehbase')
        echo $dockerps
	ids=$(echo $dockerps |cut -d ' ' -f 1)
	echo $ids | xargs docker stop
	echo $ids | xargs docker rm
}

log(){
	$(boot2dockershellinit)
	id=$(docker ps | grep ubeeko/standalonehbase |cut -d ' ' -f 1)
	echo "Show HBase logs"
	docker logs -f $id
}

start(){
	$(up)
	echo "Starting HBase container"
	mkdir -p $APPS/share
	echo $(docker rm standalonehbase 2> /dev/null)
	STANDALONEHBASE=$(docker run \
		-d \
		-p 2181:2181 \
		-p 8080:8080 \
		-p 8085:8085 \
		-p 9090:9090 \
		-p 9095:9095 \
		-p 60000:60000 \
		-p 60010:60010 \
		-p 60020:60020 \
		-p 60030:60030 \
		-v $APPS/share:/share \
		--name standalonehbase \
		--net host \
		ubeeko/standalonehbase)
	echo "Started standalonehbase in container $STANDALONEHBASE"
}

update(){
	$(boot2dockershellinit)
	git pull
	$DIR/build-images.sh
}

case "$1" in
	init)
		boot2docker init
		$(up)
		ip=$(boot2dockerip)
		echo "Update /etc/hosts with the following line:"
		echo "$ip	boot2docker"
		echo "Then use $0 start to start the hbase container and connect to it with the name boot2docker"
		;;
	up)
		boot2dockerup
		;;
	shutdown)
		boot2docker down
		;;
	restart)
		stop
		start
		;;
	start)
		start
		;;
	stop)
		stop
		;;
	log)
		log
		;;
	kill)
		killz
		;;
	update)
		update
		;;
	ssh)
		boot2docker ssh
		;;
	status)
		$(boot2dockershellinit)
		boot2docker status && docker ps
		;;
	*)
		echo $"Usage: $0 {start|stop|log|kill|update|restart|status|up|shutdown|ssh}"
		RETVAL=1
esac

