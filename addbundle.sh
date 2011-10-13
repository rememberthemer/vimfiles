#!/bin/bash

if [ $# -ne 1 ]; then
    echo "usage: ${0##*/} bundle-git-repo "
    exit 0
fi

# if [ $(git status -s | wc -l) -ne 0 ]; then
#     echo "git repo is not clean, commit changes before proceeding"
#     exit 1
# fi
bundlepath="bundle"
bundlegit=$1
bundlename=${1##*/}
bundlename=${bundlename%.git}
bundlename=$bundlepath/$bundlename

git submodule add $bundlegit $bundlename
if [ $? -ne 0 ]; then
    exit 1
fi
git submodule init
git submodule update
git config --file=.gitmodules submodule.${bundlename}.ignore dirty
git add .gitmodules
git commit -m "$bundlename added"
