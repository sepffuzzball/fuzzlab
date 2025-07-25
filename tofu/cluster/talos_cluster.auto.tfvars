talos_cluster_config = {
  name = "fuzzlab"
  # Only use a VIP if the nodes share a layer 2 network
  # Ref: https://www.talos.dev/v1.9/talos-guides/network/vip/#requirements
  vip     = "10.0.100.100"
  gateway = "10.0.100.1"
  gatewayv6 = "fdca:fe37:11aa:a100::"
  # The version of talos features to use in generated machine configuration. Generally the same as image version.
  # See https://github.com/siderolabs/terraform-provider-talos/blob/main/docs/data-sources/machine_configuration.md
  # Uncomment to use this instead of version from talos_image.
  # talos_machine_config_version = "v1.9.2"
  proxmox_cluster    = "fuzzlab"
  kubernetes_version = "v1.33.1" # renovate: github-releases=kubernetes/kubernetes
  #cilium = {
  #  bootstrap_manifest_path = "talos/inline-manifests/cilium-install.yaml"
  #  values_file_path        = "../../k8s/infra/network/cilium/values.yaml"
  #}
  gateway_api_version = "v1.3.0" # renovate: github-releases=kubernetes-sigs/gateway-api
  extra_manifests     = []
  kubelet             = <<-EOT
    extraArgs:
      # Needed for Netbird agent https://kubernetes.io/docs/tasks/administer-cluster/sysctl-cluster/#enabling-unsafe-sysctls
      allowed-unsafe-sysctls: net.ipv4.conf.all.src_valid_mark
  EOT
  api_server          = <<-EOT
    extraArgs:
      oidc-issuer-url: "https://auth.fzbl.xyz"
      oidc-client-id: "kubectl"
      oidc-username-claim: "preferred_username"
      oidc-username-prefix: "authentik:"
      oidc-groups-claim: "groups"
      oidc-groups-prefix: "authentik:"
  EOT
}
