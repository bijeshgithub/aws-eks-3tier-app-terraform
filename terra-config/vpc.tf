# Get Default VPC              # Here, the data block is used to read/fetch existing resources, help to just avoid duplication
data "aws_vpc" "default" {       
  default = true
}

# Get default Subnet ids
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
