FROM centos:centos6

RUN yum update -y
RUN yum -y install centos-release-gluster312
RUN yum -y install glusterfs glusterfs-fuse mount

ADD ./mount_gluster.sh /
RUN chmod 777 ./mount_gluster.sh

CMD bin/bash