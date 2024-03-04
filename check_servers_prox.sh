#!/bin/bash

# [ip range start] [ip range end] [target ip /24 in this case and ending with .] [port number]

server=$3   # get ip from args
for ((i=$1; i<=$2; i++)); do    # loop through the ip range given
    target=$server+i            # create the target ip
    if nc -z $target $4; then   # check if the tager is running a service on the specefied port
        serverList+=$target+", "    # add to the list of servers
    fi
done

echo "$serverList"  # return the completed list
