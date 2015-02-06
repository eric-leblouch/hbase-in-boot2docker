from ubeeko/standalonebasehbase

VOLUME ["/share"]

#Zookeeper
EXPOSE 2181
#Master
EXPOSE 60000
#Master info
EXPOSE 60010
#Region server
EXPOSE 60020
#Region server info
EXPOSE 60030
#REST
EXPOSE 8080
#REST info
EXPOSE 8085
#Thrift
EXPOSE 9090
#Thrift info
EXPOSE 9095

CMD ["/hbase-inner.sh"]
