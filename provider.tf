provider "aws" {
  region = var.region
}

provider "vault" {
  address = "http://3.76.153.111:8200"
}