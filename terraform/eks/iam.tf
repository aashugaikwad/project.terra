module "eks_iam" {
  source  = "terraform-aws-modules/iam/aws//modules/eks"
  cluster_name = "k8s-cluster"
}

resource "aws_iam_instance_profile" "eks_node" {
  name  = "eks-node-profile"
  role  = module.eks_iam.worker_iam_role_name
}

