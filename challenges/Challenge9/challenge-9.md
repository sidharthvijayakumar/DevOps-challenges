# DevOps & Linux Shell Scripting Assignment

Welcome to the hands-on DevOps assessment. This assignment focuses on real-world Linux system administration and Bash automation tasks, covering log parsing, system health checks, process management, and automated backups.

---

## Instructions
1. Clone or copy this repository/file to your local Linux environment or server.
2. Complete each task by writing the appropriate Bash commands or scripts.
3. Use the provided sample log file (`access.log`) to test and verify your solution for **Task 1**.

---

## Sample Log Data (`access.log`)

To test **Task 1**, save the following log entries as `access.log` in your working directory or run the setup command below:

```text
192.168.1.10 - - [09/Aug/2026:14:02:10 +0000] "GET /api/v1/users HTTP/1.1" 200 1234 "-" "Mozilla/5.0"
203.0.113.45 - - [09/Aug/2026:14:02:11 +0000] "POST /api/v1/checkout HTTP/1.1" 500 532 "-" "curl/7.68.0"
203.0.113.45 - - [09/Aug/2026:14:02:12 +0000] "POST /api/v1/checkout HTTP/1.1" 502 157 "-" "curl/7.68.0"
198.51.100.22 - - [09/Aug/2026:14:02:15 +0000] "GET /static/css/main.css HTTP/1.1" 200 4521 "[https://example.com/](https://example.com/)" "Mozilla/5.0"
203.0.113.45 - - [09/Aug/2026:14:02:16 +0000] "POST /api/v1/checkout HTTP/1.1" 504 182 "-" "curl/7.68.0"
198.51.100.99 - - [09/Aug/2026:14:02:18 +0000] "GET /api/v1/payment HTTP/1.1" 503 204 "-" "PostmanRuntime/7.28.4"
203.0.113.45 - - [09/Aug/2026:14:02:20 +0000] "POST /api/v1/checkout HTTP/1.1" 500 532 "-" "curl/7.68.0"
192.168.1.15 - - [09/Aug/2026:14:02:22 +0000] "GET /index.html HTTP/1.1" 200 892 "-" "Mozilla/5.0"
198.51.100.99 - - [09/Aug/2026:14:02:25 +0000] "GET /api/v1/payment HTTP/1.1" 500 532 "-" "PostmanRuntime/7.28.4"
203.0.113.45 - - [09/Aug/2026:14:02:28 +0000] "POST /api/v1/checkout HTTP/1.1" 500 532 "-" "curl/7.68.0"
198.51.100.99 - - [09/Aug/2026:14:02:30 +0000] "GET /api/v1/payment HTTP/1.1" 502 157 "-" "PostmanRuntime/7.28.4"
192.168.1.50 - - [09/Aug/2026:14:02:33 +0000] "GET /healthz HTTP/1.1" 200 12 "-" "KubeProbe/1.25"
203.0.113.45 - - [09/Aug/2026:14:02:35 +0000] "POST /api/v1/checkout HTTP/1.1" 503 204 "-" "curl/7.68.0"
```

# Task 1: Log Parsing & Incident Triage

## Scenario
An application served by Nginx is experiencing `50x` internal server errors[cite: 1]. You need to identify top offending client IP addresses causing or experiencing these high error rates[cite: 1].

## Requirements
1. Filter out all log entries in `access.log` returning HTTP status codes in the `500-599` range[cite: 1].
2. Extract the client IP address (the first column)[cite: 1].
3. Sort and count occurrences per IP[cite: 1].
4. Output the top 5 IPs along with their respective error counts[cite: 1].
