1. Filter out all log entries in `access.log` returning HTTP status codes in the `500-599` range[cite: 1].

Ans. For this we can use awk with regex patterns
```bash
root@ubuntu-dev:/opt# awk '$9 ~/^5[0-9][0-9]$/ {print $0}' access.log 
203.0.113.45 - - [09/Aug/2026:14:02:11 +0000] "POST /api/v1/checkout HTTP/1.1" 500 532 "-" "curl/7.68.0"
203.0.113.45 - - [09/Aug/2026:14:02:12 +0000] "POST /api/v1/checkout HTTP/1.1" 502 157 "-" "curl/7.68.0"
203.0.113.45 - - [09/Aug/2026:14:02:16 +0000] "POST /api/v1/checkout HTTP/1.1" 504 182 "-" "curl/7.68.0"
198.51.100.99 - - [09/Aug/2026:14:02:18 +0000] "GET /api/v1/payment HTTP/1.1" 503 204 "-" "PostmanRuntime/7.28.4"
203.0.113.45 - - [09/Aug/2026:14:02:20 +0000] "POST /api/v1/checkout HTTP/1.1" 500 532 "-" "curl/7.68.0"
198.51.100.99 - - [09/Aug/2026:14:02:25 +0000] "GET /api/v1/payment HTTP/1.1" 500 532 "-" "PostmanRuntime/7.28.4"
203.0.113.45 - - [09/Aug/2026:14:02:28 +0000] "POST /api/v1/checkout HTTP/1.1" 500 532 "-" "curl/7.68.0"
198.51.100.99 - - [09/Aug/2026:14:02:30 +0000] "GET /api/v1/payment HTTP/1.1" 502 157 "-" "PostmanRuntime/7.28.4"
203.0.113.45 - - [09/Aug/2026:14:02:35 +0000] "POST /api/v1/checkout HTTP/1.1" 503 204 "-" "curl/7.68.0"
```

2. 