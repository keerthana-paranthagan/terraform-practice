terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

variable "file_names" {
  type = set(string)
}

resource "local_file" "files" {
  for_each = var.file_names

  filename = "${each.value}.txt"
  content  = "This is file ${each.value}"
}
