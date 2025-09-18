Create main.py code and test it in local once it works

## Test this on ec2 instance 
1. Create a ec2 instance by using Opentofu repository https://github.com/sidharthvijayakumar/Opentofu
2. Ensure you run a user data script which will install python
3. Copy the required code to the ec2 instanc3
```commandline
scp -i /./Users/sidharth/demo-key-pair.pem main.py requriements.txt ec2-user@<public-ip>:/home/ec2-user
```
4. Validate the changes by running python3 main.py