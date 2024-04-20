#!/bin/bash
# Usage:
#       check_rebase.sh [current branch] [integration branch]

trg=$1
itg=$2

git fetch origin main:main
git fetch origin $GITHUB_HEAD_REF:$GITHUB_HEAD_REF

if [[ -z $trg ]]; then
    trg=HEAD
fi
if [[ -z $itg ]]; then
    itg=main
fi

ret=$(git rev-list $trg..$itg)
if [[ -z $ret ]]; then
    echo "You have no need to rebase."
else
    echo "You need rebase to absorb the following changes:"
    for r in $ret
    do
        echo $r
    done
    exit 1
fi