#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh
source ${CBENCH_HOME}/config/gcp.conf

USAGE="

    $0

    Usage:
        The script allocates and formats nodes in GCP

    Optional Arguments:

        --cluster           Name of the Cluster

        --zone              Zone (default: ${ZONE_ID}).

        --ssh-user          User id

        --server-nodes      Number of server nodes in cluster
        --server-type       Server Instance Type
        --server1-type      Server Instance Type for node1
        --threads-per-core  1|2 only used for server nodes

        --driver-nodes      Number of driver nodes
        --driver-type       Driver Instance Type

        --maxscale-nodes    Number of MaxScale nodes
        --maxscale-type     MaxScale Instance Type

        --persistentdisk    gcp persistent disk
        --disk-type         GCP disk type
        --disk-size         Size of persistent disk

        -h | --help         Show usage message and exit

    Notes:
        1.  ...
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --cluster)                  CLUSTER="$1"; shift;;

        --zone)                     ZONE_ID="$1"; shift;;

        --server-nodes)             NUMOFSERVERS="$1"; shift;;
        --server-type)              SERVER_INSTANCE_TYPE="$1"; shift;;
        --server1-type)             SERVER1_INSTANCE_TYPE="$1"; shift;;
        --threads-per-core)         OPTION_THREADS_PER_CORE="$1"; shift;;

        --driver-nodes)             NUMOFDRIVERS="$1"; shift;;
        --driver-type)              DRIVER_INSTANCE_TYPE="$1"; shift;;

        --maxscale-nodes)           NUMOFMAXSCALE="$1"; shift;;
        --maxscale-type)            MAXSCALE_INSTANCE_TYPE="$1"; shift;;

        --persistentdisk)           PERSISTENTDISK=TRUE;;
        --disk-type)                DISK_TYPE="$1"; shift;;
        --disk-size)                DISK_SIZE="$1"; shift;;

        --disablewritebarrier)      DISABLE_WRITE_BARRIER='-o nobarrier';;
        --lazyinit)                 LAZY_INIT="$1"; shift;;
        --readaheadcache)           READAHEAD_CACHE="$1"; shift;;
        --ssh-user)                 SSH_USER="$1"; shift;;
        --skipcheck)                OPTION_SKIPCHECK=TRUE;;
        --background)               OPTION_BACKGROUND=TRUE;;
        --parallel)                 OPTION_BACKGROUND=TRUE;;

        -h|--help)                  echo -e "$USAGE"; exit 1;;

        *) echo "Invalid input switch: $key"; echo -e "COMMAND_LINE = ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done


[[ ${NUMOFSERVERS} ]] || NUMOFSERVERS=0
[[ ${NUMOFDRIVERS} ]] || NUMOFDRIVERS=0
[[ ${NUMOFMAXSCALE} ]] || NUMOFMAXSCALE=0

[[ ${SERVER1_INSTANCE_TYPE} ]] || SERVER1_INSTANCE_TYPE=${SERVER_INSTANCE_TYPE}
[[ ${NUMOFLOCALDISKS} ]] || NUMOFLOCALDISKS=0

# default to persistent unless local is specified
[[ ! ${PERSISTENTDISK} && ${NUMOFLOCALDISKS} == 0 ]] && PERSISTENTDISK=TRUE

# default lazyinit on
[[ ${LAZY_INIT} ]] || LAZY_INIT=TRUE
[[ ${LAZY_INIT} == TRUE ]] && OPTION_LAZY_INIT='-E lazy_itable_init=0,lazy_journal_init=0,discard'

# default create swapfile
[[ ${MKSWAP} ]] || MKSWAP=TRUE


# replace forbidden characters in cluster name
SANITIZED_CLUSTER=$(echo ${CLUSTER} | perl -pe 'tr/A-Z\._/a-z\-\-/')

# logging
TEST_NAME=gcp.allocate.nodes
[[ ${CLUSTER} ]] || CLUSTER=gcp${NUMOFSERVERS}.${SERVER_INSTANCE_TYPE}.$(date +%y%m%d.%H%M%S%3N)
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}


# set system ids based on cluster and number
(( NUMOFNODES = ${NUMOFSERVERS} + ${NUMOFDRIVERS} + ${NUMOFMAXSCALE} ))
for (( IDX = 1 ; IDX <= ${NUMOFSERVERS} ; IDX++ )) ; do
    INSTANCE_IDS+=( ${SANITIZED_CLUSTER}-server-${IDX} )
    SERVER_INSTANCE_IDS+=( ${SANITIZED_CLUSTER}-server-${IDX} )
done
for (( IDX = 1 ; IDX <= ${NUMOFDRIVERS} ; IDX++ )) ; do
    INSTANCE_IDS+=( ${SANITIZED_CLUSTER}-driver-${IDX} )
    DRIVER_INSTANCE_IDS+=( ${SANITIZED_CLUSTER}-driver-${IDX} )
done
for (( IDX = 1 ; IDX <= ${NUMOFMAXSCALE} ; IDX++ )) ; do
    INSTANCE_IDS+=( ${SANITIZED_CLUSTER}-maxscale-${IDX} )
    MAXSCALE_INSTANCE_IDS+=( ${SANITIZED_CLUSTER}-maxscale-${IDX} )
done


{
    echo
    echo "===== Begin $0 =====  [ $(date -u  '+%Y-%m-%d %H:%M:%S.%3N') ]"
    STARTSECONDS=${SECONDS}

    echo "
        $0 ${COMMAND_LINE}

            CLUSTER                 = ${CLUSTER}
            SANITIZED_CLUSTER       = ${SANITIZED_CLUSTER}

            ZONE_ID                 = ${ZONE_ID}
            SERVER_INSTANCE_TYPE    = ${SERVER_INSTANCE_TYPE}
            SERVER1_INSTANCE_TYPE   = ${SERVER1_INSTANCE_TYPE}
            DRIVER_INSTANCE_TYPE    = ${DRIVER_INSTANCE_TYPE}
            MAXSCALE_INSTANCE_TYPE  = ${MAXSCALE_INSTANCE_TYPE}

            NUMOFNODES              = ${NUMOFNODES}
            NUMOFSERVERS            = ${NUMOFSERVERS}
            NUMOFMAXSCALE           = ${NUMOFMAXSCALE}
            NUMOFDRIVERS            = ${NUMOFDRIVERS}

            PERSISTENTDISK          = ${PERSISTENTDISK}
            DISK_TYPE               = ${DISK_TYPE}
            DISK_SIZE               = ${DISK_SIZE}

            NUMOFLOCALDISKS         = ${NUMOFLOCALDISKS}
            DISKINTERFACE           = ${DISKINTERFACE}

            SSH_USER                = ${SSH_USER}
            SSH_PEM_FILE            = ${SSH_PEM_FILE}

            INSTANCE_IDS            = ${INSTANCE_IDS[*]}
            SERVER_INSTANCE_IDS     = ${SERVER_INSTANCE_IDS[*]}
            DRIVER_INSTANCE_IDS     = ${DRIVER_INSTANCE_IDS[*]}
            MAXSCALE_INSTANCE_IDS   = ${MAXSCALE_INSTANCE_IDS[*]}

            TESTID                  = ${TESTID}
            LOGDIRECTORY            = ${LOGDIRECTORY}
    "

    echo
    echo "    ===== Provisioning Nodes  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {

        gcloud config set project ${GCP_PROJECT}
        gcloud compute instances list
        unset PIDLIST

        if (( ${NUMOFSERVERS} > 0 )) ; then
            # Provision Server instances
            N=0
            for INSTANCE in ${SERVER_INSTANCE_IDS[*]} ; do
                # instance and zone
                COMMAND="gcloud compute instances create ${INSTANCE} --zone ${ZONE_ID}"
                # boot image
                COMMAND="${COMMAND} --image-family=${IMAGE_FAMILY} --image-project=${IMAGE_PROJECT}"
                # instance type
                if (( ${N} == 0 )) ; then
                    COMMAND="${COMMAND} --machine-type=${SERVER1_INSTANCE_TYPE} --min-cpu-platform=Automatic"
                else
                    COMMAND="${COMMAND} --machine-type=${SERVER_INSTANCE_TYPE} --min-cpu-platform=Automatic"
                fi
                # threads-per-core is only relevant for servers
                [[ ${OPTION_THREADS_PER_CORE} ]] && {
                    COMMAND="${COMMAND} --threads-per-core=${OPTION_THREADS_PER_CORE}"
                }
                # persistent disk
                [[ ${PERSISTENTDISK} ]] && {
                    COMMAND="${COMMAND} --create-disk name=${INSTANCE}-disk,device-name=cbench-disk"
                    COMMAND="${COMMAND},type=${DISK_TYPE},size=${DISK_SIZE}GB,auto-delete=yes"
                }
                # local disk(s)
                for (( IDX = 0 ; IDX < ${NUMOFLOCALDISKS} ; IDX++ ))
                do
                    COMMAND="${COMMAND} --local-ssd=interface=${DISKINTERFACE}"
                done
                # default SSH key
                COMMAND="${COMMAND} --metadata-from-file ssh-keys=${SSH_PUB_FILE}"

                echo "${COMMAND}"
                if [[ ${OPTION_BACKGROUND} == TRUE ]] ; then
                    ${COMMAND} &
                    PIDLIST="${PIDLIST} $!"
                else
                    ${COMMAND}
                fi
                (( N=${N}+1 ))
            done
            unset N
        fi

        if (( ${NUMOFMAXSCALE} > 0 )) ; then
            # Provision Maxscale instances
            for INSTANCE in ${MAXSCALE_INSTANCE_IDS[*]} ; do
                # instance and zone
                COMMAND="gcloud compute instances create ${INSTANCE} --zone ${ZONE_ID}"
                # boot image
                COMMAND="${COMMAND} --image-family=${IMAGE_FAMILY} --image-project=${IMAGE_PROJECT}"
                # instance type
                COMMAND="${COMMAND} --machine-type=${MAXSCALE_INSTANCE_TYPE} --min-cpu-platform=Automatic"
                # default SSH key
                COMMAND="${COMMAND} --metadata-from-file ssh-keys=${SSH_PUB_FILE}"

                echo "${COMMAND}"
                if [[ ${OPTION_BACKGROUND} == TRUE ]] ; then
                    ${COMMAND} &
                    PIDLIST="${PIDLIST} $!"
                else
                    ${COMMAND}
                fi
            done
        fi

        if (( ${NUMOFDRIVERS} > 0 )) ; then
            # Provision Driver servers
            for INSTANCE in ${DRIVER_INSTANCE_IDS[*]} ; do
                # instance and zone
                COMMAND="gcloud compute instances create ${INSTANCE} --zone ${ZONE_ID}"
                # boot image - our driver image
                COMMAND="${COMMAND} --source-machine-image=${DRIVER_IMAGE}"
                # instance type
                COMMAND="${COMMAND} --machine-type=${DRIVER_INSTANCE_TYPE} --min-cpu-platform=Automatic"
                # default SSH key
                COMMAND="${COMMAND} --metadata-from-file ssh-keys=${SSH_PUB_FILE}"

                echo "${COMMAND}"
                if [[ ${OPTION_BACKGROUND} == TRUE ]] ; then
                    ${COMMAND} &
                    PIDLIST="${PIDLIST} $!"
                else
                    ${COMMAND}
                fi
            done
        fi

        if [[ ${OPTION_BACKGROUND} == TRUE ]] ; then
            echo "waiting for background jobs"
            wait ${PIDLIST}
            unset PIDLIST
        fi

        echo
        echo "Allocated Nodes:"
        gcloud compute instances list | head -1
        gcloud compute instances list | grep ${CLUSTER}
        echo
        echo "Allocated Disk:"
        gcloud compute disks list | head -1
        gcloud compute disks list | grep ${CLUSTER}

    } 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).provision.nodes.log

    # describe instances (for debugging)
    {
        for INSTANCE in ${INSTANCE_IDS[*]} ; do
            echo
            echo "    ===== Describe ${INSTANCE}  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            echo
            COMMAND="gcloud compute instances describe ${INSTANCE} --zone ${ZONE_ID}"
            echo "${COMMAND}"
            ${COMMAND}
        done
    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).describe.nodes.log 2>&1

    # get server IP adresses
    for INSTANCE in ${SERVER_INSTANCE_IDS[*]} ; do
        SERVER_EXTERNAL_IPS+=( $(gcloud compute instances describe ${INSTANCE} --zone ${ZONE_ID} | grep 'natIP' | cut -d: -f2) )
        SERVER_INTERNAL_IPS+=( $(gcloud compute instances describe ${INSTANCE} --zone ${ZONE_ID} | grep 'networkIP' | cut -d: -f2) )
    done
    echo
    echo "    SERVER_INSTANCE_IDS = ${SERVER_INSTANCE_IDS[*]}"
    echo "    SERVER_EXTERNAL_IPS = ${SERVER_EXTERNAL_IPS[*]}"
    echo "    SERVER_INTERNAL_IPS = ${SERVER_INTERNAL_IPS[*]}"

    # get driver IP adresses
    for INSTANCE in ${DRIVER_INSTANCE_IDS[*]} ; do
        DRIVER_EXTERNAL_IPS+=( $(gcloud compute instances describe ${INSTANCE} --zone ${ZONE_ID} | grep 'natIP' | cut -d: -f2) )
        DRIVER_INTERNAL_IPS+=( $(gcloud compute instances describe ${INSTANCE} --zone ${ZONE_ID} | grep 'networkIP' | cut -d: -f2) )
    done
    echo
    echo "    DRIVER_INSTANCE_IDS = ${DRIVER_INSTANCE_IDS[*]}"
    echo "    DRIVER_EXTERNAL_IPS = ${DRIVER_EXTERNAL_IPS[*]}"
    echo "    DRIVER_INTERNAL_IPS = ${DRIVER_INTERNAL_IPS[*]}"

    # get maxscale IP adresses
    for INSTANCE in ${MAXSCALE_INSTANCE_IDS[*]} ; do
        MAXSCALE_EXTERNAL_IPS+=( $(gcloud compute instances describe ${INSTANCE} --zone ${ZONE_ID} | grep 'natIP' | cut -d: -f2) )
        MAXSCALE_INTERNAL_IPS+=( $(gcloud compute instances describe ${INSTANCE} --zone ${ZONE_ID} | grep 'networkIP' | cut -d: -f2) )
    done
    echo
    echo "    MAXSCALE_INSTANCE_IDS = ${MAXSCALE_INSTANCE_IDS[*]}"
    echo "    MAXSCALE_EXTERNAL_IPS = ${MAXSCALE_EXTERNAL_IPS[*]}"
    echo "    MAXSCALE_INTERNAL_IPS = ${MAXSCALE_INTERNAL_IPS[*]}"

    # all IP adresses together
    EXTERNAL_IPS=( ${SERVER_EXTERNAL_IPS[*]} ${DRIVER_EXTERNAL_IPS[*]} ${MAXSCALE_EXTERNAL_IPS[*]} )
    INTERNAL_IPS=( ${SERVER_INTERNAL_IPS[*]} ${DRIVER_INTERNAL_IPS[*]} ${MAXSCALE_INTERNAL_IPS[*]} )
    echo
    echo "    INSTANCE_IDS = ${INSTANCE_IDS[*]}"
    echo "    EXTERNAL_IPS = ${EXTERNAL_IPS[*]}"
    echo "    INTERNAL_IPS = ${INTERNAL_IPS[*]}"

    echo
    echo "    ===== Establish Connections to Nodes  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    # Make this atomic
    lock_semaphore
    for NODE in ${EXTERNAL_IPS[*]} ; do
        echo "Node = ${NODE}"
        ssh-keygen -f ${HOME}/.ssh/known_hosts -R ${NODE}
    done
    unlock_semaphore

    echo "    ===== Wait while nodes initialize  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    {
        ACTIVE_NODES=0
        while (( ${ACTIVE_NODES} != ${NUMOFNODES} )) ; do
            printf '.%d' ${ACTIVE_NODES}
            sleep 5
            ACTIVE_NODES=$(for NODE in ${EXTERNAL_IPS[*]} ; do ssh -o "StrictHostKeyChecking no" -i ${SSH_PEM_FILE} ${SSH_USER}@${NODE} 'uname -a'; done | grep Linux | wc -l)
        done
        echo "done"
    } 2>/dev/null

    echo
    echo "    GCP Cluster:  ${CLUSTER}"
    echo
    echo "    ===== Configure system property files  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

    for (( INDX = 0 ; INDX < ${#SERVER_INSTANCE_IDS[@]}; INDX++ )) ; do
        {
            echo
            echo "system.name = ${SERVER_INSTANCE_IDS[${INDX}]}"
            echo
            echo "system.external.ip = ${SERVER_EXTERNAL_IPS[${INDX}]}"
            echo "system.internal.ip = ${SERVER_INTERNAL_IPS[${INDX}]}"
            echo
            echo "server.cloud = gcp"
            echo "gcp.zone = ${ZONE_ID}"
            if (( ${INDX} == 0 )) ; then
                echo "gcp.instance_type = ${SERVER1_INSTANCE_TYPE}"
            else
                echo "gcp.instance_type = ${SERVER_INSTANCE_TYPE}"
            fi
            echo
            echo "ssh.user = ${SSH_USER}"
            echo "ssh.pem = ${SSH_PEM_FILE}"
            echo
        } > properties/${SERVER_INSTANCE_IDS[${INDX}]}.properties
        echo
        echo "        properties/${SERVER_INSTANCE_IDS[${INDX}]}.properties"
        cat properties/${SERVER_INSTANCE_IDS[${INDX}]}.properties
        echo
    done

    for (( INDX = 0 ; INDX < ${#DRIVER_INSTANCE_IDS[@]}; INDX++ )) ; do
        {
            echo
            echo "system.name = ${DRIVER_INSTANCE_IDS[${INDX}]}"
            echo
            echo "system.external.ip = ${DRIVER_EXTERNAL_IPS[${INDX}]}"
            echo "system.internal.ip = ${DRIVER_INTERNAL_IPS[${INDX}]}"
            echo
            echo "server.cloud = gcp"
            echo "gcp.zone = ${ZONE_ID}"
            echo "gcp.instance_type = ${DRIVER_INSTANCE_TYPE}"
            echo
            echo "ssh.user = ${SSH_USER}"
            echo "ssh.pem = ${SSH_PEM_FILE}"
            echo
        } > properties/${DRIVER_INSTANCE_IDS[${INDX}]}.properties
        echo
        echo "        properties/${DRIVER_INSTANCE_IDS[${INDX}]}.properties"
        cat properties/${DRIVER_INSTANCE_IDS[${INDX}]}.properties
        echo
    done

    for (( INDX = 0 ; INDX < ${#MAXSCALE_INSTANCE_IDS[@]}; INDX++ )) ; do
        {
            echo
            echo "system.name = ${MAXSCALE_INSTANCE_IDS[${INDX}]}"
            echo
            echo "system.external.ip = ${MAXSCALE_EXTERNAL_IPS[${INDX}]}"
            echo "system.internal.ip = ${MAXSCALE_INTERNAL_IPS[${INDX}]}"
            echo
            echo "server.cloud = gcp"
            echo "gcp.zone = ${ZONE_ID}"
            echo "gcp.instance_type = ${MAXSCALE_INSTANCE_TYPE}"
            echo
            echo "ssh.user = ${SSH_USER}"
            echo "ssh.pem = ${SSH_PEM_FILE}"
            echo
        } > properties/${MAXSCALE_INSTANCE_IDS[${INDX}]}.properties
        echo
        echo "        properties/${MAXSCALE_INSTANCE_IDS[${INDX}]}.properties"
        cat properties/${MAXSCALE_INSTANCE_IDS[${INDX}]}.properties
        echo
    done

    echo
    echo "    ===== Configure cluster properties ${CLUSTER}.properties  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    {
        echo
        echo "cluster.name = ${CLUSTER}"
        echo "systems = ${INSTANCE_IDS[*]}"
        echo
        echo "server.cloud = gcp"
        echo "gcp.zone = ${ZONE_ID}"
        echo "gcp.driver.zone = ${ZONE_ID}"
        echo "gcp.instance_type = ${SERVER_INSTANCE_TYPE}"
        if [[ ${SERVER1_INSTANCE_TYPE} != ${SERVER_INSTANCE_TYPE} ]] ; then
            echo "gcp.node1.instance_type = ${SERVER1_INSTANCE_TYPE}"
        fi
        echo
        echo "ssh.user = ${SSH_USER}"
        echo "ssh.pem = ${SSH_PEM_FILE}"
        echo
        echo "cluster.systems = ${SERVER_INSTANCE_IDS[*]}"
        echo "cluster.nodes = ${NUMOFSERVERS}"
        echo "cluster.node1 = ${SERVER_EXTERNAL_IPS[0]}"
        echo "nodes = ${SERVER_EXTERNAL_IPS[*]}"
        echo
        echo "driver.systems = ${DRIVER_INSTANCE_IDS[*]}"
        echo "driver.nodes = ${NUMOFDRIVERS}"
        echo "driver.node1 = ${DRIVER_EXTERNAL_IPS[0]}"
        echo "drivers = ${DRIVER_EXTERNAL_IPS[*]}"
        echo
    } > properties/${CLUSTER}.properties

    echo
    echo "        properties/${CLUSTER}.properties"
    cat properties/${CLUSTER}.properties
    echo

    echo
    echo "    ===== Format Data Disks  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    time {

        echo
        echo "    ===== Configuring  local drives on server ${SERVER_INSTANCE_TYPE} nodes =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        for INSTANCE in ${SERVER_INSTANCE_IDS[*]} ; do
            NODE=$(gcloud compute instances describe ${INSTANCE} --zone ${ZONE_ID} | grep natIP | cut -f6 -d' ')
            echo "Node = ${NODE}"
            {
                echo "sudo mkdir -p /data/cbench"
                if [[ ${PERSISTENTDISK} ]] ; then
                    [[ ${DISK_DEVICE} ]] || DISK_DEVICE="/dev/sdb"
                    echo "sudo mkfs.ext4 -F ${OPTION_LAZY_INIT} -j ${DISK_DEVICE}"
                    echo "sudo mount -o discard ${DISABLE_WRITE_BARRIER} ${DISK_DEVICE} /data/cbench"
                    echo "sudo blockdev --getra ${DISK_DEVICE}"
                    if [[ ${READAHEAD_CACHE} ]] ; then
                        echo "sudo blockdev --setra ${READAHEAD_CACHE} ${DISK_DEVICE}"
                        echo "sudo blockdev --getra ${DISK_DEVICE}"
                    fi
                elif [[ ${DISKINTERFACE} = "nvme" ]] ; then
                    if (( ${NUMOFLOCALDISKS} == 1 )) ; then
                        echo "sudo mkfs.ext4 -F ${OPTION_LAZY_INIT} -j /dev/nvme0n1"
                        echo "sudo mount -o discard ${DISABLE_WRITE_BARRIER} /dev/nvme0n1 /data/cbench"
                        echo "sudo blockdev --getra /dev/nvme0n1"
                        if [[ ${READAHEAD_CACHE} ]] ; then
                            echo "sudo blockdev --setra ${READAHEAD_CACHE} /dev/nvme0n1"
                            echo "sudo blockdev --getra /dev/nvme0n1"
                        fi
                    elif (( ${NUMOFLOCALDISKS} == 2 )) ; then
                        echo "sudo yum -y install mdadm"
                        echo "sudo mdadm --create /dev/md0 -l0 -n2 /dev/nvme0n1 /dev/nvme0n2"
                        echo "sudo mkfs.ext4 -F ${OPTION_LAZY_INIT} -j /dev/md0"
                        echo "sudo mount -o discard ${DISABLE_WRITE_BARRIER} /dev/md0 /data/cbench"
                        echo "sudo blockdev --getra /dev/md0"
                        if [[ ${READAHEAD_CACHE} ]] ; then
                            echo "sudo blockdev --setra ${READAHEAD_CACHE} /dev/md0"
                            echo "sudo blockdev --getra /dev/md0"
                        fi
                    elif (( ${NUMOFLOCALDISKS} == 4 )) ; then
                        echo "sudo yum -y install mdadm"
                        echo "sudo mdadm --create /dev/md0 -l0 -n4 /dev/nvme0n1 /dev/nvme0n2 /dev/nvme0n3 /dev/nvme0n4"
                        echo "sudo mkfs.ext4 -F ${OPTION_LAZY_INIT} -j /dev/md0"
                        echo "sudo mount -o discard ${DISABLE_WRITE_BARRIER} /dev/md0 /data/cbench"
                        echo "sudo blockdev --getra /dev/md0"
                        if [[ ${READAHEAD_CACHE} ]] ; then
                            echo "sudo blockdev --setra ${READAHEAD_CACHE} /dev/md0"
                            echo "sudo blockdev --getra /dev/md0"
                        fi
                    elif (( ${NUMOFLOCALDISKS} == 8 )) ; then
                        echo "sudo yum -y install mdadm"
                        echo "sudo mdadm --create /dev/md0 -l0 -n8 /dev/nvme0n1 /dev/nvme0n2 /dev/nvme0n3 /dev/nvme0n4 /dev/nvme0n5 /dev/nvme0n6 /dev/nvme0n7 /dev/nvme0n8"
                        echo "sudo mkfs.ext4 -F ${OPTION_LAZY_INIT} -j /dev/md0"
                        echo "sudo mount -o discard ${DISABLE_WRITE_BARRIER} /dev/md0 /data/cbench"
                        echo "sudo blockdev --getra /dev/md0"
                        if [[ ${READAHEAD_CACHE} ]] ; then
                            echo "sudo blockdev --setra ${READAHEAD_CACHE} /dev/md0"
                            echo "sudo blockdev --getra /dev/md0"
                        fi
                    fi
                else
                    if (( ${NUMOFLOCALDISKS} == 1 )) ; then
                        echo "sudo mkfs.ext4 -F ${OPTION_LAZY_INIT} -j /dev/sdb"
                        echo "sudo mount -o discard ${DISABLE_WRITE_BARRIER} /dev/sdb /data/cbench"
                        echo "sudo blockdev --getra /dev/sdb"
                        if [[ ${READAHEAD_CACHE} ]] ; then
                            echo "sudo blockdev --setra ${READAHEAD_CACHE} /dev/sdb"
                            echo "sudo blockdev --getra /dev/sdb"
                        fi
                    elif (( ${NUMOFLOCALDISKS} == 2 )) ; then
                        echo "sudo yum -y install mdadm"
                        echo "sudo mdadm --create /dev/md0 -l0 -n2 /dev/sdb /dev/sdc"
                        echo "sudo mkfs.ext4 -F ${OPTION_LAZY_INIT} -j /dev/md0"
                        echo "sudo mount -o discard ${DISABLE_WRITE_BARRIER} /dev/md0 /data/cbench"
                        echo "sudo blockdev --getra /dev/md0"
                        if [[ ${READAHEAD_CACHE} ]] ; then
                            echo "sudo blockdev --setra ${READAHEAD_CACHE} /dev/md0"
                            echo "sudo blockdev --getra /dev/md0"
                        fi
                    elif (( ${NUMOFLOCALDISKS} == 4 )) ; then
                        echo "sudo yum -y install mdadm"
                        echo "sudo mdadm --create /dev/md0 -l0 -n4 /dev/sdb /dev/sdc /dev/sdd /dev/sde"
                        echo "sudo mkfs.ext4 -F ${OPTION_LAZY_INIT} -j /dev/md0"
                        echo "sudo mount -o discard ${DISABLE_WRITE_BARRIER} /dev/md0 /data/cbench"
                        echo "sudo blockdev --getra /dev/md0"
                        if [[ ${READAHEAD_CACHE} ]] ; then
                            echo "sudo blockdev --setra ${READAHEAD_CACHE} /dev/md0"
                            echo "sudo blockdev --getra /dev/md0"
                        fi
                    elif (( ${NUMOFLOCALDISKS} == 8 )) ; then
                        echo "sudo yum -y install mdadm"
                        echo "sudo mdadm --create /dev/md0 -l0 -n8 /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg /dev/sdh /dev/sdi"
                        echo "sudo mkfs.ext4 -F ${OPTION_LAZY_INIT} -j /dev/md0"
                        echo "sudo mount -o discard ${DISABLE_WRITE_BARRIER} /dev/md0 /data/cbench"
                        echo "sudo blockdev --getra /dev/md0"
                        if [[ ${READAHEAD_CACHE} ]] ; then
                            echo "sudo blockdev --setra ${READAHEAD_CACHE} /dev/md0"
                            echo "sudo blockdev --getra /dev/md0"
                        fi
                    fi
                fi

                echo "sudo chmod a+w /data/cbench"
                echo "df -h"
                if [[ ${MKSWAP} == TRUE ]] ; then
                    echo "cd /data/cbench"
                    echo "sudo if=/dev/zero of=swapfile bs=1m count=16384"
                    echo "sudo mkswap swapfile"
                    echo "sudo chmod 600 swapfile"
                    echo "sudo swapon swapfile"
                fi
            } | ssh -T -o "StrictHostKeyChecking no" -i ${SSH_PEM_FILE} ${SSH_USER}@${NODE} &
        done
        wait
        sleep 10

    }

    echo
    echo "    ===== Running post-alloc jobs =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    COMMAND="cloud.post.alloc.sh --cluster ${CLUSTER}"
    echo "        COMMAND = ${COMMAND}"
    time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).post.alloc.log 2>&1

    echo
    echo "    ===== Nodes Provisioned  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    echo "        INSTANCE_IDS = ${INSTANCE_IDS[*]}"
    echo "        EXTERNAL_IPS = ${EXTERNAL_IPS[*]}"
    echo "        INTERNAL_IPS = ${INTERNAL_IPS[*]}"

    #####################

    echo
    echo "        SSH Connection : ssh $(get_ssh_connection)"
    echo
    echo "    ===== End $0  ( Elapsed Seconds = $(( ${SECONDS} - ${STARTSECONDS} )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log

