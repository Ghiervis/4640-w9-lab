packer {
  required_plugins {
    # COMPLETE ME
    # add necessary plugins for ansible and aws
    amazon = {
      version = "~> 1.3"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  # COMPLETE ME
  # add configuration to use Ubuntu 24.04 image as source image
  region        = "us-west-2"
  instance_type = "t2.micro"
  ami_name      = "packer-ansible-nginx"
  ssh_username  = "ubuntu"
  
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250115"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners      = ["099720109477"]
    most_recent = true
  }
}

build {
  # COMPLETE ME
  # add configuration to: 
  # - use the source image specified above
  # - use the "ansible" provisioner to run the playbook in the ansible directory
  # - use the ssh user-name specified in the "variables.pkr.hcl" file

  sources = ["source.amazon-ebs.ubuntu"]
  name    = "4640-lab-wk9"

  provisioner "ansible" {
    playbook_file     = "../ansible/playbook.yml"
    ansible_env_vars  = ["ANSIBLE_HOST_KEY_CHECKING=False"]
    user             = "ubuntu"
  }
}

