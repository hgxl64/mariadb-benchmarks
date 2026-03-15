#!/bin/bash
#
# configure network latency on 10G network interface between (g1, g2) and (g3)

set -e
#set -u

USAGE="$0 <run> <operation>"

i=${1:?"run number not given!"}
shift
ii=$(printf "%02d" $i)

. config.sh
test -e config.${ii} && . config.${ii}


#sanitize defaults

[[ $BANDWIDTH ]] || BANDWIDTH="1gbit"
[[ $LATENCY ]]  || LATENCY=0
[[ $NETDEV ]]   || NETDEV="eno1"

op=${1:?"operation not given!"}

case ${op} in
  clear)
    echo "clearing network settings on $(hostname)"
    sudo tc qdisc del dev ${NETDEV} root || true
    ;;

  show)
    sudo tc class show dev ${NETDEV}
    sudo tc qdisc show dev ${NETDEV}
    sudo tc filter show dev ${NETDEV}
    ;;

  set)
    h=$(hostname)
    echo "setting network (latency=${LATENCY}, bandwidth=${BANDWIDTH}) on ${h}"

    #clear everything (just in case)
    sudo tc qdisc del dev ${NETDEV} root || true

    sudo tc qdisc add dev ${NETDEV} root handle 1: htb default 999
    sudo tc class add dev ${NETDEV} parent 1: classid 1:1 htb rate ${BANDWIDTH} ceil ${BANDWIDTH}
    sudo tc class add dev ${NETDEV} parent 1:1 classid 1:999 htb rate ${BANDWIDTH} ceil ${BANDWIDTH}
    sudo tc qdisc add dev ${NETDEV} parent 1:999 handle 2: fq_codel

    case ${h} in
    g1)
      if [[ ${LATENCY} != 0 ]]
      then
        sudo tc class add dev ${NETDEV} parent 1:1 classid 1:10 htb rate ${BANDWIDTH} ceil ${BANDWIDTH} prio 1
        sudo tc qdisc add dev ${NETDEV} parent 1:10 handle 100 netem delay ${LATENCY} limit 1000
        sudo tc filter add dev ${NETDEV} protocol ip parent 1: prio 1 u32 match ip dst 172.20.0.166 flowid 1:10
      fi
      ;;
    g2)
      if [[ ${LATENCY} != 0 ]]
      then
        sudo tc class add dev ${NETDEV} parent 1:1 classid 1:10 htb rate ${BANDWIDTH} ceil ${BANDWIDTH} prio 1
        sudo tc qdisc add dev ${NETDEV} parent 1:10 handle 100 netem delay ${LATENCY} limit 1000
        sudo tc filter add dev ${NETDEV} protocol ip parent 1: prio 1 u32 match ip dst 172.20.0.166 flowid 1:10
      fi
      ;;
    g3)
      if [[ ${LATENCY} != 0 ]]
      then
        sudo tc class add dev ${NETDEV} parent 1:1 classid 1:10 htb rate ${BANDWIDTH} ceil ${BANDWIDTH} prio 1
        sudo tc qdisc add dev ${NETDEV} parent 1:10 handle 100 netem delay ${LATENCY} limit 1000
        sudo tc filter add dev ${NETDEV} protocol ip parent 1: prio 1 u32 match ip dst 172.20.0.164 flowid 1:10
        sudo tc class add dev ${NETDEV} parent 1:1 classid 1:11 htb rate ${BANDWIDTH} ceil ${BANDWIDTH} prio 1
        sudo tc qdisc add dev ${NETDEV} parent 1:11 handle 110 netem delay ${LATENCY} limit 1000
        sudo tc filter add dev ${NETDEV} protocol ip parent 1: prio 1 u32 match ip dst 172.20.0.165 flowid 1:11
      fi
      ;;
    *)
      echo "don't know how to setup latency on host '${h}'"
      exit 1
      ;;
    esac
    ;;

  *)
    echo "unknown operation '$op'"
    exit 1
    ;;
esac
                                                                                                                                        

