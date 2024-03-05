#!/bin/bash

# [ip range start] [ip range end] [target ip /24 in this case and ending with .] [port number]

server=$3   # get ip from args
for ((i=$1; i<=$2; i++)); do    # loop through the ip range given
    target=$server$i            # create the target ip
    if nc -z -w 1 $target $4; then  # check if the tager is running a service on the specefied port
        serverList+=$target", "     # add to the list of servers
    fi


    # Calculate the ratio
    $divisor=3
    ratio=$(echo "scale=2; $i / $divisor" | bc)

    # Perform comparisons
    if [ $(echo "$ratio < 1/3" | bc) -eq 1 ]; then
        echo -ne '#####                     (33%)\r'
    elif [ $(echo "$ratio >= 1/3 && $ratio < 2/3" | bc) -eq 1 ]; then
        echo -ne '#############             (66%)\r'
    else
        echo -ne '#######################   (100%)\r'
    fi

    if [$i/$2<(1/3)]; then
    echo -ne '#####                     (33%)\r'
    elif [$i/$2<(2/3)]
    echo -ne '#############             (66%)\r'
    sleep 1
    echo -ne '#######################   (100%)\r'
    echo -ne '\n'

done

echo "$serverList"  # return the completed list
