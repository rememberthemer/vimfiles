#!/bin/bash

if [ $# -ne 1 ]; then
    echo "usage: ${0##*/} bundlepath "
    exit 0
fi

# if [ $(git status -s | wc -l) -ne 0 ]; then
#     echo "git repo is not clean, commit changes before proceeding"
#     exit 1
# fi

bundlepath=$1
if [ ! -d "$bundlepath" ]; then
    echo "error: could not find bundle: '$bundlepath'"
    exit 1
fi
bundlename=${bundlepath%%/}
echo $bundlepath $bundlename
git rm --cached ${bundlename}
if [ $? -ne 0 ]; then
    exit 1
fi
rm -rf $bundlepath

git config --file=.gitmodules --remove-section submodule.${bundlename}
git config --remove-section submodule.${bundlename}
git add .gitmodules
git commit -m "$bundlename removed"
