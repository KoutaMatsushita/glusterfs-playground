#!/bin/bash
LIMIT=5
SLEEP_TIME=3
NODE1_NAME="gluster-node1"
NODE2_NAME="gluster-node2"
NODE_VOLUME_DIR="/glusterfs/distributed"
VOLUME_NAME="test_volume"

command_retry() {
    local cnt=0
    until eval $1 || [ $cnt -eq $LIMIT ]; do
        sleep $SLEEP_TIME
        (( cnt++ ))
    done
}

command_retry "gluster peer probe ${NODE1_NAME}"
command_retry "gluster peer probe ${NODE2_NAME}"
command_retry "gluster vol create ${VOLUME_NAME} transport tcp ${NODE1_NAME}:${NODE_VOLUME_DIR} ${NODE2_NAME}:${NODE_VOLUME_DIR} force"
command_retry "gluster vol start ${VOLUME_NAME}"