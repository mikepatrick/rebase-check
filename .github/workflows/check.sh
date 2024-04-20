#!/bin/bash
# Usage:
#       check_rebase.sh [current branch] [integration branch]

current_branch=$1
target_branch=$2

git fetch origin main:main
git fetch origin $GITHUB_HEAD_REF:$GITHUB_HEAD_REF

if [[ -z $current_branch ]]; then
    trg=HEAD
fi
if [[ -z $itg ]]; then
    target_branch=main
fi

ret=$(git rev-list $current_branch..$target_branch)
if [[ -z $ret ]]; then
    echo "PR branch up to date with target."
    echo "No rebase required."
else
    echo "PR branch is behind target branch."
    echo "Rebase required to absorb the following changes:"
    for r in $ret
    do
        echo $r
    done
    exit 1
fi