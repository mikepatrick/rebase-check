hash1=$(git show-ref --heads -s origin/main)
hash2=$(git merge-base origin/main $GITHUB_HEAD_REF)
if [ "${hash1}" = "${hash2}" ]
then
    echo "OK"
else
    echo "Rebase required"
    exit 1
fi
