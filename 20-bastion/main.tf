module "bastion" {
    source = "terraform-aws-modules/ec2-instance/aws"

    ami =
    name =
    instance_type =
    vpc_security_group_ids = 
    subnet_id =
    user_data = file("bastion.sh")

}