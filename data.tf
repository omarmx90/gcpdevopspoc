data "google_compute_image" "debian" {
  family  = "ubuntu-1804-lts"
  project = "gce-uefi-images"
}

data "template_file" "nginx" {
  template = file("${path.module}/template/install_nginx.tpl")

  vars = {
    ufw_allow_nginx = "Nginx HTTP"
  }
}