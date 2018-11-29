# must be run as root
GSERVER ?= gserver
GBRICK ?= /data/k8s/EFK
GVOLUME ?= efk_shared

TEST_FOLDER = /tmp/k8s


gluster_ready: gluster_create cp_files

gluster_create:
	mkdir -p ${GBRICK}
	gluster volume create ${GVOLUME} ${GSERVER}:${GBRICK} force
	gluster volume start ${GVOLUME}

cp_files:
	mkdir -p ${GBRICK}/etc
	cp -Rf ./volumes/fluentd/etc/* ${GBRICK}/etc


gluster_delete:
	gluster volume stop ${GVOLUME} force
	gluster volume delete ${GVOLUME}


# test
gluster_mount:
	mkdir -p ${TEST_FOLDER}
	mount -t glusterfs ${GSERVER}:/${GBRICK} ${TEST_FOLDER}
	ls ${TEST_FOLDER}

gluster_umount:
	umount ${TEST_FOLDER}
