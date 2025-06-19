data "sops_file" "pm-password-secret" {
  source_file = "./bootstrap/sops/pm-password-secret.sops.yaml"
}

data "sops_file" "pm-sshkeys-secret" {
  source_file = "./bootstrap/sops/pm-sshkeys-secret.sops.yaml"
}

data "sops_file" "pm-sshprivate-secret" {
  source_file = "./bootstrap/sops/pm-sshprivate-secret.sops.yaml"
}

data "sops_file" "pm-api-secret" {
  source_file = "./bootstrap/sops/pm-api-secret.sops.yaml"
}
