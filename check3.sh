#!/bin/bash
# Usage:
#       check_rebase.sh [current branch] [integration branch]

trg=$1
itg=$2

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
fi