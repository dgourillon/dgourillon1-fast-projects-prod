data "terraform_remote_state" "bootstrap" {
  backend = "remote"
  config = {
    organization = "dgourillon1"
    workspaces = {
      name = "dgourillon1-fast-boootstrap"
    }
  }
}

data "terraform_remote_state" "resman" {
  backend = "remote"
  config = {
    organization = "dgourillon1"
    workspaces = {
      name = "dgourillon1-fast-resman"
    }
  }
}

data "terraform_remote_state" "network" {
  backend = "remote"
  config = {
    organization = "dgourillon1"
    workspaces = {
      name = "dgourillon1-fast-network"
    }
  }
}

locals {
  # Common tags to be assigned to all resources
  organization = data.terraform_remote_state.bootstrap.outputs.organization
  automation   = data.terraform_remote_state.bootstrap.outputs.automation
  top_folder   = data.terraform_remote_state.bootstrap.outputs.top_folder
  billing_account   = data.terraform_remote_state.bootstrap.outputs.billing_account
  service_accounts_from_remote  = data.terraform_remote_state.resman.outputs.service_accounts
  folder_ids  = data.terraform_remote_state.resman.outputs.folder_ids
  custom_roles_from_remote = data.terraform_remote_state.bootstrap.outputs.custom_roles
  host_project_ids = data.terraform_remote_state.network.outputs.host_project_ids
  vpc_self_links = data.terraform_remote_state.network.outputs.shared_vpc_self_links
}



