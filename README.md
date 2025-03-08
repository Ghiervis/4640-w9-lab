# 4640-w9-lab-start-w25

See lab instructions on D2L

# ACIT 4640 - Week 9 Lab

## Requirements

Before proceeding, ensure the following tools are installed and configured:

- AWS CLI (with valid credentials)
- Packer
- Terraform
- Git

## Execution Steps

### 1. Create an AMI using Packer

Navigate to the `packer` directory and execute the following:

```sh
cd packer
packer init .
packer build .
```

### 2. Deploy Infrastructure with Terraform

Move to the `terraform` directory and apply the configuration:

```sh
cd ../terraform
terraform init
terraform apply
```

### 3. Verify the Deployment

After Terraform completes, verify that the instance is up and running:

- Connect via SSH using the displayed IP address.
- Confirm Nginx is running:
  ```sh
  systemctl status nginx
  ```
- Open a browser and enter the public IP to check the Nginx welcome page.

### 4. Cleanup

To tear down the deployed resources, run:

```sh
terraform destroy
```

