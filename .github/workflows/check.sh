hash1=$(git show-ref --heads -s origin/main)
hash2=$(git merge-base origin/main $GITHUB_HEAD_REF)
[ "${hash1}" = "${hash2}" ] && echo "OK" || exit 1
