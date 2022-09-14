terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "agents" {
  source = "../.."

  friendly_name_prefix = var.friendly_name_prefix
  common_tags          = var.common_tags
  region               = var.region

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  tfc_agent_token  = var.tfc_agent_token
  tfc_address      = var.tfc_address
  tfc_agent_name   = var.tfc_agent_name
  number_of_agents = var.number_of_agents
  agent_image      = var.agent_image
  assign_public_ip = var.assign_public_ip
  enable_logs      = var.enable_logs
  cpu              = var.cpu
  memory           = var.memory
}