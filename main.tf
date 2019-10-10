locals {
  kubeconfig_path = "/Users/lbriggs/.kube/config.d"
}

module "dev1_cluster" {
  source                     = "github.com/jaxxstorm/terraform-do-kubernetes"
  do_token                   = "${var.do_token}"
  do_region                  = "sfo2"
  cluster_name               = "dev1"
  cluster_default_node_size  = "${var.node_size}"
  cluster_default_node_count = "${var.node_count}"
  kubeconfig_path            = "${local.kubeconfig_path}/dev1.yaml"
  cluster_version            = var.cluster_version
}


module "prod1_cluster" {
  source                     = "github.com/jaxxstorm/terraform-do-kubernetes"
  do_token                   = "${var.do_token}"
  do_region                  = "sfo2"
  cluster_name               = "prod1"
  cluster_default_node_size  = "${var.node_size}"
  cluster_default_node_count = "${var.node_count}"
  kubeconfig_path            = "${local.kubeconfig_path}/prod1.yaml"
  cluster_version            = var.cluster_version
}

module "prod2_cluster" {
  source                     = "github.com/jaxxstorm/terraform-do-kubernetes"
  do_token                   = "${var.do_token}"
  do_region                  = "sgp1"
  cluster_name               = "prod2"
  cluster_default_node_size  = "${var.node_size}"
  cluster_default_node_count = "${var.node_count}"
  kubeconfig_path            = "${local.kubeconfig_path}/prod2.yaml"
  cluster_version            = var.cluster_version
}
