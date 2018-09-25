LIMIT=5
SLEEP_TIME=5
GLUSTER_SERVER_NAME="gluster-server"
GLUSTER_VOLUME_NAME="/test_volume"
MOUNT_POINT="/mnt"

command_retry() {
    local cnt=0
    until eval $1 || [ $cnt -eq $LIMIT ]; do
        sleep $SLEEP_TIME
        (( cnt++ ))
    done
}

command_retry "mount -t glusterfs ${GLUSTER_SERVER_NAME}:${GLUSTER_VOLUME_NAME} ${MOUNT_POINT}"
echo "mounted!"