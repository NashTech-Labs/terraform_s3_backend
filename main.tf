terraform {
  backend "s3"{
    bucket = "" #Please provide your bucket name
    key = "terraform.tfstate"
    region = "us-east-1" # Provide your aws region
  }
}


provider "aws" {
  # Configuration options
  region = "us-east-1" # Provide your aws region

}

module "apache" {
  source = "akpriyadarshi/apache-example/aws" 
  vpc_id = var.vpc_id
  public_key = var.public_key
  instance_type = var.instance_type
  server_name = var.server_name
}

output "public_ip" {
  value = module.apache.EC2_IP
}


