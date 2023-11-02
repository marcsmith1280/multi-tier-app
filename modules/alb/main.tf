#Creation of Application Load balancer
resource "aws_alb" "application_load_balancer" {
  name               = "${var.environment}-${var.application}-alb"
  internal           = var.internal
  load_balancer_type = var.loadbalancer_type

  subnets         = var.alb_subnets
  security_groups = var.security_group_ids

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-alb",
      Environment = var.environment,
      createdBy   = var.createdBy,
      Application = var.application
    },
    var.tags
  )
}

#Creation of Target Group 
resource "aws_alb_target_group" "alb_tg" {
  name_prefix = "alb-tg"
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  load_balancing_algorithm_type = var.load_balancing_algorithm

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-alb-target-group"
      Environment = var.environment,
      createdBy   = var.createdBy,
      Application = var.application
    },
    var.tags
  )
}

#Creation of ALB listener on ports
resource "aws_alb_listener" "application_listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    target_group_arn = aws_alb_target_group.alb_tg.arn
    type             = var.listener_type
  }
}

# For HTTP to HTTPS redirects, to invoke HTTPS redirects a SSL certificate is needed to secure the data transmitted. 
# All traffic hitting the domain from either port 80 or 443 is redirected to 443. 
# At time of lab I do not have a ssl certificate. Here is a script if that was not the case. 

#resource "aws_alb_listener" "redirect_listener" {
  #load_balancer_arn = aws_alb.application_load_balancer.arn
  #port              = var.listener_port
  #protocol          = var.listener_protocol

  #default_action {
    #target_group_arn = aws_alb_target_group.alb_tg.arn
    #type             = var.listener_type

    #redirect {
        #port = "var.redirect_port"
        #protocol = "var.redirect_protocol"
        #status_code = "var.status_code"
    #}
  #}
#}

#The following variables would need to be added in the following locations

#modules\alb\variables.tf 
#environment\dev\alb-asg\variables.tf

#variables
#variable "redirect_port" {
  #description = "Redirect listener port"
  #type        = number
#}

#variable "redirect_protocol" {
  #description = "Redirect listener protocol"
  #type        = string
#}

#variable "status_code" {
  #description = "Redirect status code"
  #type        = string
#}

# In the file environment\dev\alb-asg\main.tf

#redirect_protocol = var.redirect_protocol
#redirect_port = var.redirect_port
#status_code = var.status_code

# In the file dev-vpc\vars\dev\alb-asg.tfvars alb_listener

#redirect_protocol = "HTTPS"
#redirect_port = "443"
#status_code = "HTTP_301"
