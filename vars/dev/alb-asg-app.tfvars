#Variable definitions. Change specific details like region, ami, subnets, ports, keypairs, user data, etc to run this script
region = "us-east-1"

# alb
internal          = true
loadbalancer_type = "application"
alb_subnets       = ["subnet-0aa46faa5687d3e95", "subnet-032f48b0eb888a0c2","subnet-0127ee7a420d3f4fe"]

#alb-sg
alb_ingress_cidr_from_port = ["443"]
alb_ingress_cidr_to_port   = ["443"]
alb_ingress_cidr_protocol  = ["tcp"]
alb_ingress_cidr_block     = ["0.0.0.0/0"]
alb_create_ingress_cidr    = false

alb_ingress_sg_from_port = [443]
alb_ingress_sg_to_port   = [443]
alb_ingress_sg_protocol  = ["tcp"]
ingress_security_group_ids = ["sg-0987f8d3308d42c70"]
alb_create_ingress_sg    = true


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
ingress_cidr_protocol  = ["tcp"]
ingress_cidr_block     = ["10.0.0.23/32"]
create_ingress_cidr    = true

ingress_sg_from_port = [443]
ingress_sg_to_port   = [443]
ingress_sg_protocol  = ["tcp"]
create_ingress_sg    = true

egress_cidr_from_port = [0]
egress_cidr_to_port   = [0]
egress_cidr_protocol  = ["-1"]
egress_cidr_block     = ["0.0.0.0/0"]
create_egress_cidr    = true

egress_sg_from_port = [443]
egress_sg_to_port   = [443]
egress_sg_protocol  = ["tcp"]
create_egress_sg    = false

# target_group
target_group_port        = 443
target_group_protocol    = "HTTP"
target_type              = "instance"
load_balancing_algorithm = "round_robin"

# health_check
health_check_path                = "/"
health_check_port                = 443
health_check_protocol            = "HTTPS"
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
asg_subnets   = ["subnet-0aa46faa5687d3e95", "subnet-032f48b0eb888a0c2","subnet-0127ee7a420d3f4fe"]
public_access = false

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
createdBy   = "M.Smith"
environment = "dev"
application = "php-app"
