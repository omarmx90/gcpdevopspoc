terraform {
  backend "gcs" {
    bucket  = "devopsiac"
    prefix  = "terraform/state"
    credentials = file(var.credentials)
  }
}