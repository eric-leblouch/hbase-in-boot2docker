from ubeeko/java

RUN apt-get -y -q install ssh rsync

RUN mkdir /root/.ssh
RUN ssh-keygen -t dsa -P '' -f /root/.ssh/id_dsa
RUN cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys
RUN chmod go-rwx /root/.ssh/id_dsa
RUN chmod go-rwx /root/.ssh/authorized_keys

RUN mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
