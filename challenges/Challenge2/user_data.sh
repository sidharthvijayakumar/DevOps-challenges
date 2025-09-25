#!/bin/bash
sudo yum update
sudo yum install nginx -y
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
#Enable and start State nginx service
sudo systemctl enable nginx.service
sudo systemctl start nginx.service
#Install cloudwatch agent
sudo yum install amazon-cloudwatch-agent -y
#Enable and state cloud watch agent
sudo systemctl enable amazon-cloudwatch-agent
sudo systemctl start amazon-cloudwatch-agent

#Check the system arch
ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    echo "Installing package for x86_64"
    #Instal ssm agent for x86
    sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm 
   # Install cloud watch agent
elif [ "$ARCH" = "aarch64" ]; then
    echo "Installing package for ARM64"
    #Install ssm agent for arm
    sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_arm64/amazon-ssm-agent.rpm
else
    echo "Unknown architecture: $ARCH"
fi
#Enable and start the ssm
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent