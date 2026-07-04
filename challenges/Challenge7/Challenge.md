# 🚀 DevOps Friday Challenge: Learn sed/awk/grep commands

## 🎯 Objective

Create a file in your linux direcotry

```bash
101:John:DevOps:85000:Pune
102:Alice:Developer:75000:Mumbai
103:Bob:DevOps:92000:Bangalore
104:Charlie:QA:65000:Pune
105:David:Developer:80000:Chennai
106:Eve:Manager:120000:Mumbai
107:Frank:DevOps:88000:Pune
108:Grace:QA:70000:Bangalore
109:Helen:Developer:95000:Pune
110:Ian:Manager:130000:Chennai
111:Jack:DevOps:78000:Mumbai
112:Kate:QA:72000:Pune
```

---

## 🧩 Scenario

You are deploying a simple web application in Kubernetes with the following requirements:

- Application should start with **1 pod**
- It should **auto-scale under load**
- Scaling should have a **maximum limit**
- You must **observe and validate scaling behavior**

---

## 🛠️ Tasks

1. Find all employees from Pune.
2. Find all DevOps employees.
3. Find all lines containing “Manager”.
4. Find employees whose names start with J.
5. Find employees whose names end with e.

6. Find employees from either Pune or Mumbai.
7. Show line numbers for DevOps employees.
8. Count the number of QA employees.
9. Find lines that do NOT contain Developer.
10. Find employees with IDs starting with 10.

11. Find employees earning 90000 or more (grep only).
12. Find names containing exactly 5 characters.
13. Find employees whose city ends with “ore”.
14. Find all employees except those from Pune.
15. Find duplicate departments (you may need pipes).