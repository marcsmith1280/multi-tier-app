#vpc variable definitions, change specifics like region, cidr, and subnets to run this script.
region               = "us-east-1"
vpc_cidr_block       = "10.1.0.0/16"
instance_tenancy     = "default"
enable_dns_support   = true
enable_dns_hostnames = true

#elastic ip
domain = "vpc"

#nat-gateway
create_nat_gateway = true

#route-table
destination_cidr_block = "0.0.0.0/0"

#subnet
map_public_ip_on_launch    = true
public_subnet_cidr_blocks  = ["10.1.0.0/24", "10.1.1.0/24","10.1.2.0/24"]
private_subnet_cidr_blocks = ["10.1.3.0/24", "10.1.4.0/24","10.1.5.0/24"]
db_subnet_cidr_blocks      = ["10.1.6.0/24", "10.1.7.0/24","10.1.8.0/24"]
availability_zones         = ["us-east-1a", "us-east-1b", "us-east-1c"]

#tags
owner       = "M.Smith"
environment = "dev"
application = "vpc"
cost_center = "6SportsGaming"