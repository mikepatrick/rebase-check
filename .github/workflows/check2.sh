git fetch origin main:main
git fetch origin $GITHUB_HEAD_REF:$GITHUB_HEAD_REF
hash1=$(git show-ref --heads -s main)
hash2=$(git merge-base main $GITHUB_HEAD_REF)
if [ "${hash1}" = "${hash2}" ]
then
    echo "OK"
else
    echo "Rebase required"
    exit 1
fi