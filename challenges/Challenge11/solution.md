```bash
#!/usr/bin/env bash

set -euo pipefail

printf "The disk usage which you have entered is: %s \n" $1
echo "***********************************"
if [[ $1 =~ ^[0-9]+$ ]];then
    if [[ $1 -lt 70 ]];then
        printf "NORMAL \n"
    elif [[ $1 -ge 70 && $1 -lt 80 ]];then
        printf "WARNING \n"
    elif [[ $1 -ge 80 && $1 -lt 90 ]];then
        printf "HIGH \n"
    elif [[ $1 -ge 90 && $1 -lt 95 ]];then
            printf "CRITICAL"
    elif [[ $1 -ge 95 && $1 -le 100 ]];then
            printf "EMERGENCY"
    else
        printf "You have entered $1 as disk usage which is not realistic!\n"
        echo "***********************************"
        exit 1
    fi
else

    printf "Input entered is not a number!\n"
fi
echo "***********************************"
```