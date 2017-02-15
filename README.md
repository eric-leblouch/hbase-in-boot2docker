# hbase-in-boot2docker

* Deprecated in favor of the * [docker-machine version](https://github.com/hfactory/hfactory-server-in-docker-machine)

A hbase standalone docker inside a boot2docker for Mac OS.

Restarting the container allows you to start again with an empty hbase server.

## Prerequisites
To use this container, you need to have VirtualBox and Boot2docker installed.

### VirtualBox

In order to install VirtualBox, go to : https://www.virtualbox.org/wiki/Downloads

- Download the Mac OS X version
- Double click on the dmg
- Double click on the pkg
- Follow instructions, default are good
- Doubleclick on Applications
- Launch the VirtualBox application from the Applications folder

That is all, you can eject the mounted VirtualBox partition

### Boot2Docker

In order to install Boot2Docker, go to : https://github.com/boot2docker/osx-installer/releases

- Download the last version
- Double click on the pkg
- Follow instructions, default are good

That is all

## Using the hbase in boot2docker

For ease of use you can put the hbase-in-boot2docker/bin folder in your path

### First initialization

Launch ```hbase-env.sh init``` and edit the /etc/hosts file as required

### Using the container

To start the container simply use ```hbase-env.sh start```

The container is launched in host-only mode and you can connect to it directly using boot2docker for the hbase.zookeeper.quorum property

To stop the all the docker containers use ```hbase-env.sh stop```

To read the logs ```hbase-env.sh log```

To kill the container if stopping it does not work ```hbase-env.sh kill```

To restart the container ```hbase-env.sh restart``` does stop/start

For getting the status ```hbase-env.sh status``` gives you boot2docker status on the first line and if possible the docker processes running on the following ones

## Boot2Docker related commands

To launch the boot2docker VM ```hbase-env.sh up```

To connect to it ```hbase-env.sh ssh```

To stop it ```hbase-env.sh shutdown```
