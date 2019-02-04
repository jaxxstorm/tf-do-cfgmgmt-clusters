locals {
  kubeconfig_path = "/Users/lbriggs/.kube/config.d"
}

module "dev1_cluster" {
  source                     = "github.com/jaxxstorm/terraform-do-kubernetes"
  do_token                   = "${var.do_token}"
  do_region                  = "ams3"
  cluster_name               = "dev1"
  cluster_default_node_size  = "${var.node_size}"
  cluster_default_node_count = "${var.node_count}"
  kubeconfig_path            = "${local.kubeconfig_path}/dev1.yaml"
}

resource "null_resource" "kubeconfig_dev1" {
  provisioner "local-exec" {
    command = "kubectl config rename-context do-ams3-dev1 lbriggs@dev1"
  }

  depends_on = ["module.dev1_cluster"]
}

module "prod1_cluster" {
  source                     = "github.com/jaxxstorm/terraform-do-kubernetes"
  do_token                   = "${var.do_token}"
  do_region                  = "ams3"
  cluster_name               = "prod1"
  cluster_default_node_size  = "${var.node_size}"
  cluster_default_node_count = "${var.node_count}"
  kubeconfig_path            = "${local.kubeconfig_path}/prod1.yaml"
}

resource "null_resource" "kubeconfig_prod1" {
  provisioner "local-exec" {
    command = "kubectl config rename-context do-ams3-prod1 lbriggs@prod1"
  }

  depends_on = ["module.prod1_cluster"]
}

module "prod2_cluster" {
  source                     = "github.com/jaxxstorm/terraform-do-kubernetes"
  do_token                   = "${var.do_token}"
  do_region                  = "lon1"
  cluster_name               = "prod2"
  cluster_default_node_size  = "${var.node_size}"
  cluster_default_node_count = "${var.node_count}"
  kubeconfig_path            = "${local.kubeconfig_path}/prod2.yaml"
}

resource "null_resource" "kubeconfig_prod2" {
  provisioner "local-exec" {
    command = "kubectl config rename-context do-lon1-prod2 lbriggs@prod2"
  }

  depends_on = ["module.prod2_cluster"]
}
