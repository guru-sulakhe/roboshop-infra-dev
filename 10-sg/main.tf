module "mysql_sg" {
    source = "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git"
    project_name = var.project_name
    environment = var.environment
    sg_name = "mysql"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.mysql_sg_tags
}

module "bastion_sg" {
    source = "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git"
    project_name = var.project_name
    environment = var.environment
    sg_name = "bastion"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    #sg_tags = var.bastion_sg_tags
}

module "node_sg" {
    source = "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git"
    project_name = var.project_name
    environment = var.environment
    sg_name = "node"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    #sg_tags = var.bastion_sg_tags
}

module "eks_control_plane_sg" {
    source = "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git"
    project_name = var.project_name
    environment = var.environment
    sg_name = "eks_control_plane"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    #sg_tags = var.eks_control_plane_sg_tags
}

module "ingress_alb_sg" {
    source = "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git"
    project_name = var.project_name
    environment = var.environment
    sg_name= "ingress_alb_sg"
    vpc_id = local.vpc_id
    common_tags = var.common_tags

}