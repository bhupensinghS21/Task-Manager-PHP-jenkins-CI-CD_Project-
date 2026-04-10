terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
  backend "local" {
    path = "./terraform.tfstate"
  }
}

resource "local_file" "example_config" {
  filename = "${path.module}/example.txt"
  content  = "This simulates a local config file created by Terraform."
}

resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "echo Simulate app setup locally"
  }
}
