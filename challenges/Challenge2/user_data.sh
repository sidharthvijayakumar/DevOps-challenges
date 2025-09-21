#!/bin/bash
sudo yum update
sudo yum install nginx -y
sudo systemctl enable nginx.service
sudo yum install telnet -y
sudo tee /usr/share/nginx/html/index.html > /dev/null <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your IP Address</title>
  <style>
    body {
      width: 40em;
      margin: 2em auto;
      font-family: Tahoma, Verdana, Arial, sans-serif;
      text-align: center;
    }
    h1 { color: #333; }
  </style>
</head>
<body>
  <h1>Your Public IP Address</h1>
  <p id="ip">Detecting…</p>

  <script>
    // Fetch your public IP from a free service
    fetch('https://api.ipify.org?format=json')
      .then(response => response.json())
      .then(data => {
        document.getElementById('ip').textContent = data.ip;
      })
      .catch(() => {
        document.getElementById('ip').textContent = 'Unable to detect IP';
      });
  </script>
</body>
</html>
EOF
sudo systemctl start nginx.service