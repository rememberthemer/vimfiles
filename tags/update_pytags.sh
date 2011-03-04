#!/bin/bash

pyvers=(2.7)


# for pyver in ${pyvers[*]}; do

#         find /usr/lib/python${pyver} \
#              /usr/lib/pymodules/python${pyver} \
#              /usr/local/lib/python${pyver} \
#              -name *.py \
#                 > pyfiles_${pyver}.txt

#         ctags -R --fields=+i --extra=+q -f ~/.vim/tags/python${pyver}.tags -L pyfiles_${pyver}.txt 

# done

if [ `lsb_release -is` == "Arch" ]; then
    py2=`python2 -V 2>&1 | cut -d' ' -f2`
    py2=${py2%.*}
    echo $py2
    find /usr/lib/python${py2} -type f -name '*.py' |
        ctags -R --fields=+i --extra=+q --filter=yes > ~/.vim/tags/python${py2}.tags
    py3=`python -V 2>&1 | cut -d' ' -f2`
    py3=${py3%.*}
    echo $py3
    find /usr/lib/python${py3} -type f -name '*.py' |
        ctags -R --fields=+i --extra=+q --filter=yes > ~/.vim/tags/python${py3}.tags


fi
