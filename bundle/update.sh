#!/bin/bash

for d in *; do
    if [ -d $d ]; then
        echo "################# UPDATING $d"
        if [ -d "$d/.git" ]; then
            cd $d && git pull
            if [ $? -ne 0 ]; then 
                echo "@@@@@@@@@@@@@@@@ ERROR UPDATING $d"
            fi
            cd ..
        fi
    fi
done

