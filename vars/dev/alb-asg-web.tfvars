#Variable definitions. Change specific details like region, ami, subnets, ports, keypairs, user data, etc to run this script
region = "us-east-1"

# alb
internal          = false
loadbalancer_type = "application"
alb_subnets       = ["subnet-045234bc12eb4c5d2", "subnet-05e8f5352806872cb","subnet-009852d6dc5a2ac63"]

#alb-sg
alb_ingress_cidr_from_port = ["80","443"]
alb_ingress_cidr_to_port   = ["80","443"]
alb_ingress_cidr_protocol  = ["tcp", "tcp"]
alb_ingress_cidr_block     = ["0.0.0.0/0","0.0.0.0/0"]
alb_create_ingress_cidr    = true

alb_ingress_sg_from_port = [80]
alb_ingress_sg_to_port   = [80]
alb_ingress_sg_protocol  = ["tcp"]
alb_create_ingress_sg    = false

alb_egress_cidr_from_port = [0]
alb_egress_cidr_to_port   = [0]
alb_egress_cidr_protocol  = ["-1"]
alb_egress_cidr_block     = ["0.0.0.0/0"]
alb_create_egress_cidr    = true

alb_egress_sg_from_port = [0]
alb_egress_sg_to_port   = [0]
alb_egress_sg_protocol  = ["-1"]
alb_create_egress_sg    = false

# instance sg
ingress_cidr_from_port = [22]
ingress_cidr_to_port   = [22]
ingress_cidr_protocol  = ["tcp", "tcp"]
ingress_cidr_block     = ["0.0.0.0/0"]
create_ingress_cidr    = true

ingress_sg_from_port = [80]
ingress_sg_to_port   = [80]
ingress_sg_protocol  = ["tcp"]
create_ingress_sg    = true

egress_cidr_from_port = [0]
egress_cidr_to_port   = [0]
egress_cidr_protocol  = ["-1"]
egress_cidr_block     = ["0.0.0.0/0"]
create_egress_cidr    = true

egress_sg_from_port = [80]
egress_sg_to_port   = [80]
egress_sg_protocol  = ["tcp"]
create_egress_sg    = false

# target_group
target_group_port        = 80
target_group_protocol    = "HTTP"
target_type              = "instance"
load_balancing_algorithm = "round_robin"

# health_check
health_check_path                = "/"
health_check_port                = 80
health_check_protocol            = "HTTP"
health_check_interval            = 30
health_check_timeout             = 5
health_check_healthy_threshold   = 2
health_check_unhealthy_threshold = 2

#alb_listener
listener_port     = 80
listener_protocol = "HTTP"
listener_type     = "forward"




#launch_template
ami_id        = "ami-0df435f331839b2d6"
instance_type = "t3.medium"
key_name      = "dev2023"
vpc_id        = "vpc-04847e6a50e4db5b5"
asg_subnets   = ["subnet-045234bc12eb4c5d2", "subnet-05e8f5352806872cb","subnet-009852d6dc5a2ac63"]
public_access = true

#user_data
user_data = <<-EOF
                                    #!/bin/bash
                                    yum install httpd -y
                                    service httpd start
                                    chkconfig httpd on
                                    mkdir /var/www/html
                                    echo "<html><h1>Hello World</h1></html>">/var/www/html/index.html
                                   EOF

#autoscaling_group
max_size             = 2
min_size             = 1
desired_capacity     = 1
propagate_at_launch  = true
instance_warmup_time = 30
target_value         = 50

#tags
environment = "dev"
createdBy   = "M.Smith"
application = "apache-app"
