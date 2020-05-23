#!/bin/sh

password=$1

bugger=$(echo -n "$password" | sha1sum | cut -c 1-40)

sha1_a=$(echo "$bugger" | head -c 5)
sha1_b=$(echo "$bugger" |  tail -c 36)
sha1list=$(wget -q -O - https://api.pwnedpasswords.com/range/$sha1_a)
echo $sha1list | grep --ignore-case --quiet $sha1_b
rc=$?

if [ $rc -eq 0 ]; then
    echo "\"$password\" has been pwned! Do not use!"
else
    echo "\"$password\" is safe:)"
fi

