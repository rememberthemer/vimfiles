#!/bin/bash

if [ `lsb_release -is` == "Arch" ]; then
    py2=`python2 -V 2>&1 | cut -d' ' -f2 | cut -d'.' -f1,2`
    py2="python${py2}"
    echo =================================================
    echo Tags for ${py2}
    echo =================================================
    ctags -R --fields=+i --extra=+q --sort=yes --languages=Python \
        -o ~/.vim/tags/${py2}.tags /usr/lib/${py2}
    
    py3=`python -V 2>&1 | cut -d' ' -f2 | cut -d'.' -f1,2`
    py3="python${py3}"
    echo =================================================
    echo Tags for${py3}
    echo =================================================
    ctags -R --fields=+i --extra=+q --sort=yes --languages=Python \
        -o ~/.vim/tags/${py3}.tags /usr/lib/${py3}
fi
