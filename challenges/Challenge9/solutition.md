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
203.0.500.45 - - [09/Aug/2026:14:02:35 +0000] "POST /api/v1/checkout HTTP/1.1" 503 204 "-" "curl/7.68.0"
```

2. Extract the client IP address (the first column)[cite: 1].
```bash
root@ubuntu-dev:/opt# awk '{print $1}' access.log 
192.168.1.10
203.0.113.45
203.0.113.45
198.51.100.22
203.0.113.45
198.51.100.99
203.0.113.45
192.168.1.15
198.51.100.99
203.0.113.45
198.51.100.99
192.168.1.50
203.0.113.45
203.0.500.45
203.0.500.45
192.168.1.10
```
3. Sort and count occurrences per IP[cite: 1].

```bash
root@ubuntu-dev:/opt#  awk 'NF{print $1}' access.log|sort |uniq -c
      2 192.168.1.10
      1 192.168.1.15
      1 192.168.1.50
      1 198.51.100.22
      3 198.51.100.99
      6 203.0.113.45
      2 203.0.500.45
```

4. Output the top 5 IPs along with their respective error counts[cite: 1].
```bash
root@ubuntu-dev:/opt# awk '$9 >= 200 && $9 <= 599 {print $1}' access.log | sort | uniq -c | sort -nr | head -5
      6 203.0.113.45
      3 198.51.100.99
      2 203.0.500.45
      2 192.168.1.10
      1 198.51.100.22
```