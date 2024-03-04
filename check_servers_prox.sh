#!/bin/bash

# grab ip range

# ping ip range for service
# if there is a proxmox 

server=$3
for ((i=$1; i<=$2; i++)); do
    target=$server+i
    if nc -z $target; then
        serverList+=$target+", "
    fi
done

echo "$serverList"
