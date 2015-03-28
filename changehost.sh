#!/bin/bash

$again = True
while [ $again ]
    hostname=`shuf -n 2 /usr/share/dict/words | tr '\n' '.' | tr '[:upper:]' '[:lower:]' | tr -cd "[.a-z]" | sed "s/\.$//"`
    hostname $hostname
    sed -i "s/HOSTNAME=.*/HOSTNAME=$hostname/" /etc/sysconfig/network
    clear
    echo $hostname
    read -p "Keep? [y/n]" again
    if [ "$again" = "n" ]
    then
        $again = False
    else
        $again = True
    fi
echo "Exit session & login again to apply changes"
