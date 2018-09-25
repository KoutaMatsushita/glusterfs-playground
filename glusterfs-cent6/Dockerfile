FROM centos:centos6

RUN yum update -y
RUN yum -y install centos-release-gluster312
RUN yum -y install glusterfs-server
RUN mkdir -p /glusterfs/distributed

ADD ./server_init.sh /
RUN chmod 777 ./server_init.sh

CMD sh -c "service glusterd start && /etc/rc.d/init.d/glusterd start && bin/bash"