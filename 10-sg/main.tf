module "mysql_sg" {
    source "git::https://github.com/guru-sulakhe/terraform-aws-securitygroup.git"
    project_name = var.project_name
    environment = var.environment
    sg_name = var.sg_name
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.sg_tags
}