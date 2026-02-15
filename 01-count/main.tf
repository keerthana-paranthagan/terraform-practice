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
  type = list(string)
}

resource "local_file" "files" {
  count    = length(var.file_names)
  filename = "${var.file_names[count.index]}.txt"
  content  = "This is file ${var.file_names[count.index]}"
}
