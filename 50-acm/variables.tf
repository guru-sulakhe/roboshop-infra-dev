variable "project_name" {
    default = "roboshop"
}
variable "environment" {
    default = "dev"
}
variable "common_tags" {
    default = {
        Project = "roboshop"
        Environment = "dev"
        Terraform = true
    }
}
variable "zone_name" {
    default = "guru97s.cloud"
}
variable "zone_id" {
    default = "Z08273698E2G6XTP9T7C"
}