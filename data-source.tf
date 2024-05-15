data "aws_ami" "ami_id_info" {

    owners = [ "973714476881" ]
    most_recent = true

    filter {
      name = "name"
      values = [ "RHEL-9-DevOps-Practice" ]
    }

    filter {
      name = "root-device-type"
      values = [ "ebs" ]
    }

    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }
  
}

data "aws_route53_zone" "hostedzone_id" {
    name = "expensesnote.site"
  
}