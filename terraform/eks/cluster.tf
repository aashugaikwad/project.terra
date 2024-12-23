module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "k8s-cluster"
  cluster_version = "1.27"
  subnets         = aws_subnet.private[*].id
  vpc_id          = aws_vpc.main.id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = "my-key-pair"
    }
  }
}

