# Network Variable definitions. Change specifics like vpc, subnets, region and RDS details to run this script
region                      = "us-east-1"
vpc_id                      = "vpc-04847e6a50e4db5b5"
subnet_ids                  = ["subnet-0da5725a2050f0ebb", "subnet-0b131ec4133e7c1cb","subnet-0e1341eb7ac4ea0c6"]
multi_az                    = true
publicly_accessible         = false

# DB Vars
db_engine                   = "mysql"
db_storage_type             = "gp2"
db_username                 = "oracle"
db_instance_class           = "db.t2.micro"
db_storage_size             = 20
set_secret_manager_password = true
set_db_password             = false
db_password                 = "rdssecret"

# Security Group Vars
from_port                   = 3306
to_port                     = 3306
protocol                    = "tcp"
cidr_block                  = ["0.0.0.0/0"]
security_group_ids          = ["sg-06f73e4b94ad18803"]

# Backup vars
backup_retention_period     = 7
delete_automated_backups    = true
copy_tags_to_snapshot       = true
skip_final_snapshot         = true
apply_immediately           = true

# Tag Vars
owner                       = "M.Smith"
environment                 = "dev"
cost_center                 = "6sportsgaming"
application                 = "6sportsgaming-commerce"