module "mysql_sg" {
    source = "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "mysql"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.mysql_sg_tags
}

module "bastion_sg" {
    source = "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "bastion"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    #sg_tags = var.bastion_sg_tags
}

module "node_sg" {
    source = "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "node"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    #sg_tags = var.bastion_sg_tags
}

module "eks_control_plane_sg" {
    source = "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "eks_control_plane"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    #sg_tags = var.eks_control_plane_sg_tags
}

module "ingress_alb_sg" {
    source = "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name= "ingress_alb_sg"
    vpc_id = local.vpc_id
    common_tags = var.common_tags

}

resource "aws_security_group_rule" "ingress_alb_https" {
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_block = ["0.0.0.0/0"]
    security_group_id = module.ingress_alb_sg.id
}

resource "aws_security_group_rule" "node_ingress_alb" {
    type = "ingress"
    from_port = 30000
    to_port = 32767
    protocol = "tcp"
    source_security_group_id = module.ingress_alb_sg.id
    security_group_id = module.node_sg.id
}

resource "aws_security_group_rule" "node_eks_control_plane" {
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    source_security_group_id = module.eks_control_plane_sg.id
    security_group_id = module.node_sg.id
}

resource "aws_security_group_rule" "eks_control_plane_node" {
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    source_security_group_id = module.node_sg.id
    security_group_id = module.eks_control_plane_sg.id
}