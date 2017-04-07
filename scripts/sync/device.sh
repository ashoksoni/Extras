#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

cd $HOME

REPOS="rr/device/oneplus/oneplus3 \
       rr/device/oneplus/oneplus2 \
       rr/kernel/oneplus/msm8996 \
       rr/kernel/oneplus/msm8994"

for x in $REPOS
do
    eval cd $x
    (git checkout cm-14.1 || git checkout -b cm-14.1) > /dev/null 2>&1
    git pull upstream cm-14.1 2>err.txt
    if [ $? != 0 ]; then
        echo -e "\n--- MERGE of \"$x\" ${RED} FAILED ${NC} ---\n"
        cat err.txt
        break
    fi
    echo -e "\n--- MERGE of \"$x\" ${GREEN} SUCCESSFUL ${NC} ---\n"
    git push github cm-14.1 2>err.txt
    if [ $? != 0 ]; then
        echo -e "\n--- PUSHING of \"$x\" TO GITHUB ${RED} FAILED ${NC} ---\n"
        cat err.txt
        break
    fi
    echo -e "\n--- PUSHING of \"$x\" TO GITHUB ${GREEN} SUCCESSFUL ${NC} ---\n"
    rm -f err.txt
    eval cd $HOME
done

rm -f err.txt
