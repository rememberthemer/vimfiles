#!/bin/bash

if [ `git status -s | wc -l` -ne 0 ]; then
    echo "git repo is not clean, commit changes before proceeding"
    exit 1
fi

git submodule foreach "git pull origin master"

if [ -n "`git status -s | grep ' M bundle/'`" ]; then
    git commit -a
fi

