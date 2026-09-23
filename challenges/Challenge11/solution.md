```bash
#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 1 ]];then
    echo "No arguments provided!Exiting!"
    exit 1
fi

printf "The disk usage which you have entered is: %s \n" "$1"
echo "***********************************"
if [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]];then
    if awk "BEGIN {exit !($1 < 70)}";then
        printf "NORMAL \n"
    elif awk "BEGIN {exit !($1 < 80)}";then
        printf "WARNING \n"
    elif awk "BEGIN {exit !($1 < 90)}";then
        printf "HIGH \n"
    elif awk "BEGIN {exit !($1 < 95)}";then
            printf "CRITICAL\n"
    elif awk "BEGIN {exit !($1 <= 100)}";then
            printf "EMERGENCY\n"
    else
        printf "You have entered %s as disk usage which is not realistic!\n" "$1"
        echo "***********************************"
        exit 1
    fi
else
    printf "Input entered is not a number!\n"
    exit 1
fi
echo "***********************************"
```