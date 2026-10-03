**Bash Exercise: Log File Analyzer**

Write a script called log_analyzer.sh that accepts one log file as an argument.

Sample log file
```text
INFO User login successful
ERROR Database connection failed
INFO Request completed
WARNING Disk usage high
ERROR Timeout connecting to database
INFO User logout
WARNING Memory usage high
ERROR Database connection failed
INFO API request received
INFO API request completed
ERROR Authentication service unavailable
WARNING CPU usage high
INFO User login successful
ERROR Failed to fetch user profile
INFO Request completed
WARNING Disk usage high
ERROR Database connection failed
INFO User logout
```
Use the below command 
```bash
root@ubuntu-dev:/opt/script# cat > analyse.log <<EOF
INFO User login successful
ERROR Database connection failed
INFO Request completed
WARNING Disk usage high
ERROR Timeout connecting to database
INFO User logout
WARNING Memory usage high
ERROR Database connection failed
INFO API request received
INFO API request completed
ERROR Authentication service unavailable
WARNING CPU usage high
INFO User login successful
ERROR Failed to fetch user profile
INFO Request completed
WARNING Disk usage high
ERROR Database connection failed
INFO User logout
EOF
```
Your script should:

1. Check that exactly one argument was provided.
2. Check that the file exists and is readable.
3. Count:
    * INFO lines
    * WARNING lines
    * ERROR lines
4. Print the results like:

```text
Log Analysis
=============
INFO: 3
WARNING: 2
ERROR: 3
```
5. If the number of ERROR lines is greater than 3, print:

```text
ALERT: High number of errors!
```
Otherwise:
```text
Status: Normal
```
**Don’t use grep -c for the counting.**

Expected usage
Script should have only one argument and it should be the logfile
```text
./log_analyzer.sh application.log
```
And these should be handled:
```text
./log_analyzer.sh
./log_analyzer.sh file1.log file2.log
./log_analyzer.sh nonexistent.log
```

Bonus: Make the script correctly handle log levels regardless of whether the line contains additional spaces, e.g.:
```
ERROR    Database failed
ERROR Database failed
ERROR        Something went wrong
```