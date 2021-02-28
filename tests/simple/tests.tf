provider "aws" {
  profile = "test"
  region  = "us-east-1"
  alias   = "test"
}

module "under_test" {
  source    = "../.."
  profile   = "test"
  region    = "us-east-1"
  domain_name = "testing.com"
  ttl = "300"

  providers = {
    aws = aws.test
  }
}