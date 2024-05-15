resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = data.aws_ami.ami_id_info.id
    instance_type = var.instance_names[count.index] ==  "db" ? "t3.micro":"t2.micro"
    vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
    tags = merge(
        var.common_tags,
        {
        Name =  var.instance_names[count.index]
        Module  =   var.instance_names[count.index]   
        }
    )
}

resource "aws_security_group" "allow_ssh" {
    name =   var.sg_name
    description = var.sg_description

    ingress {
        from_port = var.sg_port
        to_port = var.sg_port
        protocol = var.sg_protocol
        cidr_blocks = var.cidr_range
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr_range
    }

    tags = var.sg_tags
}