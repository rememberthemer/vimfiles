#!/bin/bash

for d in *; do
    if [ -d $d/.git ]; then
        echo "################# UPDATING $d"
        (cd $d && git pull origin master)
    fi
done

