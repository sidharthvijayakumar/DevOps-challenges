1. To show all employees in Pune 

Ans. There are 2 ways to get this things done

```bash
root@ubuntu-dev:/opt# grep -i "pune" employees.txt 
101:John:DevOps:85000:Pune
104:Charlie:QA:65000:Pune
107:Frank:DevOps:88000:Pune
109:Helen:Developer:95000:Pune
112:Kate:QA:72000:Pune
```

This can be also done using awk command:
here we hvae usied tolower to conver to lower case and then finds pune from this and shared below

```bash
root@ubuntu-dev:/opt# awk 'tolower($0) ~ /pune/ {print $0}' employees.txt 
101:John:DevOps:85000:Pune
104:Charlie:QA:65000:Pune
107:Frank:DevOps:88000:Pune
109:Helen:Developer:95000:Pune
112:Kate:QA:72000:Pune
```

2. You can do this using grep

```bash
root@ubuntu-dev:/opt# grep -i Devops employees.txt 
101:John:DevOps:85000:Pune
103:Bob:DevOps:92000:Bangalore
107:Frank:DevOps:88000:Pune
111:Jack:DevOps:78000:Mumbai
```
You can also use awk or sed. But grep/aws is better for this.

```bash
root@ubuntu-dev:/opt# awk 'toupper($0) ~ /DEVOPS/{print $0}' employees.txt 
101:John:DevOps:85000:Pune
103:Bob:DevOps:92000:Bangalore
107:Frank:DevOps:88000:Pune
111:Jack:DevOps:78000:Mumbai
```

```bash
root@ubuntu-dev:/opt# sed -n '/:devops:/Ip' employees.txt 
101:John:DevOps:85000:Pune
103:Bob:DevOps:92000:Bangalore
107:Frank:DevOps:88000:Pune
111:Jack:DevOps:78000:Mumbai
```