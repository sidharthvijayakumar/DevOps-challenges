This is the solution for the challenge
```bash
#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]];then
	echo "This script requires a single parameter!"
	exit 1
fi
if [[ ! -f $1 ]];then
	echo "File does not exist!"
	exit 1
fi
if [[ ! -r "$1" ]];then
	echo "File is not readable!"
	exit 1
fi

printf "You have given paramaeter as %s\n" "$1"

echo "*******************************************"
ERROR=$(awk '{for(i=1;i<=NF;i++) if($i=="ERROR") count++ } END {print  count+0}' "$1")
INFO=$(awk '{for(i=1;i<=NF;i++) if($i=="INFO") count++ }END {print count+0}' "$1")
WARNING=$(awk '{for(i=1;i<=NF;i++) if($i=="WARNING") count++ } END {print count+0}' "$1")

printf "Error: %s\n" "$ERROR"
printf "INFO: %s\n" "$INFO"
printf "WARNING: %s\n" "$WARNING"
echo "*******************************************"
if [[ $ERROR -gt 3 ]];then
	printf "status: ALERT: High Number of Error!\n"
else
	printf "status: NORMAL\n"
fi
```

If needed you can use this also if log level comes at $1 postion of the log but this is not very versatile:
```bash
awk '{if($1=="INFO") count++ } END {print  count+0}' analyse.log
```