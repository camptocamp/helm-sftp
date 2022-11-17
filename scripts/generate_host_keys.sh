#!/bin/bash

OUTPUT_DIR=`dirname $0`/../ssh_host_keys
mkdir -p ${OUTPUT_DIR}

for type in rsa dsa ecdsa ed25519; do
  file=${OUTPUT_DIR}/ssh_host_${type}_key
  if [ ! -f $file ]; then
    ssh-keygen -q -f $file -N '' -t $type
    ssh-keygen -l -f $file.pub
  fi
done
