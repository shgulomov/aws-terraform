# create outputs for the module
output "cloud_vpc" {
  value = {
    vpc_id         = aws_vpc.cloud_vpc.id
    private_subnet = aws_subnet.private_subnet.*.id
    public_subnet  = aws_subnet.public_subnet.*.id
    vpc_cidr       = aws_vpc.cloud_vpc.cidr_block
  }
}