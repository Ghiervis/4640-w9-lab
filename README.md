# 4640-w9-lab-start-w25

To generate a Packer image from the project root, execute the following commands in order. Ensure that Packer, Terraform, and Ansible are installed on your system beforehand:

```bash
./scripts/import_lab_key "your SSH public key"
cd packer
packer init .
packer build .
cd ../terraform
terraform init
terraform apply
```

*(Optional)* To remove the lab key, run:
```bash
../scripts/delete_lab_key
```

##Clean up

```bash
terraform destroy (terraform directory)
```
