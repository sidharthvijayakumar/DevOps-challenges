Weekly DevOps Task

Goal: Provision an Nginx web server on AWS EC2 using Terraform, and automate its deployment with GitLab CI/CD.

⸻

1️⃣ Terraform
	•	Write a Terraform module that:
	•	Creates a security group allowing HTTP (80) and SSH (22).
	•	Launches an EC2 instance with the latest Amazon Linux 2 AMI.
	•	Installs and starts Nginx via user_data.

⸻

2️⃣ GitLab CI/CD
	•	Create a .gitlab-ci.yml file with:
	•	A job to run terraform init, plan, and apply.
	•	Use an S3 backend (or local backend if you don’t have S3).
	•	Make sure the apply step requires manual approval.

⸻

3️⃣ Verification
	•	After the pipeline runs, grab the public IP of the EC2 instance.
	•	Open it in your browser → you should see the default Nginx welcome page.

⸻

🌟 Bonus (Optional)
	•	Use an OIDC role for authentication (instead of static AWS keys).
	•	Add a Terraform output to print the EC2 public IP after apply.
	•	Configure a CloudWatch alarm to alert if CPU > 80%.