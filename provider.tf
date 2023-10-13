provider "aws" {
  region = var.region
}

provider "vault" {
  address = "http://3.75.179.188:8200"
}