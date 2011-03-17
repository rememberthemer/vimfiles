#!/bin/bash

if [ `lsb_release -is` == "Arch" ]; then
    py2=`python2 -V 2>&1 | cut -d' ' -f2`
    py2=${py2%.*}
    echo $py2
    find /usr/lib/python${py2} -type f -name '*.py' |
        ctags -R --fields=+i --extra=+q --filter=yes > ~/.vim/tags/python${py2}.tags
    py3=`python -V 2>&1 | cut -d' ' -f2`
    echo $py3
    find /usr/lib/python${py3} -type f -name '*.py' |
        ctags -R --fields=+i --extra=+q --filter=yes > ~/.vim/tags/python${py3}.tags
fi
