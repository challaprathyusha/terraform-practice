variable "instance_names" {
    type = list
    default = ["db","backend","frontend"]
}

variable "common_tags" {
    type = map
    default = {
        environment = "dev"
        terraform   = "true"
        project =   "expenses"
    }
}

variable "sg_name" {
    type = string
    default = "allow_ssh"
}

variable "sg_description" {
    type = string
    default = "allow ssh in inbound and all in outbound"
}

variable "sg_port" {
    type = number
    default = "22"
  
}

variable "sg_protocol" {
    type = string
    default = "tcp"
}

variable "cidr_range" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}

variable "sg_tags" {
    type = map
    default = {
        name = "allow ssh"
        environment = "dev"
        terraform = "true"
        project =   "expenses"
    }

}

variable "domain_name" {
    type = string
    default = "expensesnote.site"
  
}