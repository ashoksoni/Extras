#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

cd $HOME

# cm-14.1 branches

REPOS="rr/packages/providers/MediaProvider \
       rr/packages/apps/PackageInstaller \
       rr/packages/inputmethods/LatinIME \
       rr/packages/apps/Bluetooth \
       rr/device/oppo/common \
       rr/vendor/oneplus"
       
for x in $REPOS
do
    eval cd $x
    (git checkout cm-14.1 || git checkout -b cm-14.1) > /dev/null 2>&1
    git fetch github cm-14.1 2>err.txt
    git reset --hard github/cm-14.1 2>err.txt
    git pull --rebase upstream cm-14.1 2>err.txt
    if [ $? != 0 ]; then
        echo -e "\n--- MERGE of \"$x\" ${RED} FAILED ${NC} ---\n"
        cat err.txt
        exit
    fi
    echo -e "\n--- MERGE of \"$x\" ${GREEN} SUCCESSFUL ${NC} ---\n"
    git push -f github cm-14.1 2>err.txt
    if [ $? != 0 ]; then
        echo -e "\n--- PUSHING of \"$x\" TO GITHUB ${RED} FAILED ${NC} ---\n"
        cat err.txt
        exit
    fi
    echo -e "\n--- PUSHING of \"$x\" TO GITHUB ${GREEN} SUCCESSFUL ${NC} ---\n"
    rm -f err.txt
    eval cd $HOME
done

# nougat branches

cd $HOME

NREPOS="rr/packages/apps/Dialer \
        rr/vendor/cm \
        rr/build"

for y in $NREPOS
do
    eval cd $y
    (git checkout nougat || git checkout -b nougat) > /dev/null 2>&1
    git fetch github nougat 2>err.txt
    git reset --hard github/nougat 2>err.txt
    git pull --rebase upstream nougat 2>err.txt
    if [ $? != 0 ]; then
        echo -e "\n--- MERGE of \"$y\" ${RED} FAILED ${NC} ---\n"
        cat err.txt
        exit
    fi
    echo -e "\n--- MERGE of \"$y\" ${GREEN} SUCCESSFUL ${NC} ---\n"
    git push -f github nougat 2>err.txt
    if [ $? != 0 ]; then
        echo -e "\n--- PUSHING of \"$y\" TO GITHUB ${RED} FAILED ${NC} ---\n"
        cat err.txt
        exit
    fi
    echo -e "\n--- PUSHING of \"$y\" TO GITHUB ${GREEN} SUCCESSFUL ${NC} ---\n"
    rm -f err.txt
    eval cd $HOME
done
rm -f err.txt
