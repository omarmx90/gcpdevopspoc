terraform {
  backend "gcs" {
    bucket  = "devopsiac"
    prefix  = "terraform/state"
  }
}