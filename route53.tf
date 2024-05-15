resource "aws_route53_record" "r53records" {
    count = length(var.instance_names)
    zone_id = data.aws_route53_zone.hostedzone_id.id
    name    =   var.instance_names == "frontend" ? var.domain_name:"${var.instance_names[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records =   var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip]:[aws_instance.expense[count.index].private_ip]
}