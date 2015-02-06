from ubeeko/javassh

ENV HBASE_VERSION 0.98.9
ENV HADOOP_VERSION -hadoop2

RUN wget http://mir2.ovh.net/ftp.apache.org/dist/hbase/hbase-$HBASE_VERSION/hbase-$HBASE_VERSION$HADOOP_VERSION-bin.tar.gz
RUN tar xzf hbase-$HBASE_VERSION$HADOOP_VERSION-bin.tar.gz
RUN mv hbase-$HBASE_VERSION$HADOOP_VERSION hbase
ADD conf/ hbase/conf/
ADD hbase-inner.sh /
