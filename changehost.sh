#!/bin/bash

while true; do

    new_name=`shuf -n 2 /usr/share/dict/words | tr '\n' '.' | tr '[:upper:]' '[:lower:]' | tr -cd "[.a-z]" | sed "s/\.$//"`
    for i in `seq 1 5`;
    do
        echo
    done
    echo "New Hostname: $new_name"
    echo
    read -p "Keep? [ yes/no/cancel ] " keep
    if [ "$keep" = "yes" ] || [ $keep = "y" ]; then
        hostname=$new_name
        hostname $hostname
        sed -i "s/HOSTNAME=.*/HOSTNAME=$hostname/" /etc/sysconfig/network
        echo "Restart session to view applied changes"
        break
    elif [ "$keep" = "cancel" ] || [ "$keep" = "c" ]; then
        break
    fi
done
