
resource "aws_lb" "kkalb" {
  name               = "kapilterraalb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg]
  
   
  subnet_mapping {
      subnet_id = var.subnet1a_public
  }

  subnet_mapping {
      subnet_id = var.subnet1b_public
  }


  tags = {
    Name = var.alb-tag
    }

  ip_address_type = "ipv4"
}


resource "aws_lb_target_group" "kk-tg" {
    health_check {
        interval = 10
        path = "/"
        protocol = "HTTP"
        timeout = 5
        healthy_threshold = 5
        unhealthy_threshold = 2 
    }

    name = "my-tg"
    port = 80
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = var.alb_vpc_id
     
    tags = {
        Name = var.tg1-tag
    }
}


resource "aws_lb_listener" "kk-listener" {
    load_balancer_arn = aws_lb.kkalb.arn 
      port = 80
      protocol = "HTTP"
      default_action {
          target_group_arn = aws_lb_target_group.kk-tg.arn
          type = "forward"
      }
}


resource "aws_alb_target_group_attachment" "ec2_web1_attach" {
    target_group_arn = aws_lb_target_group.kk-tg.arn
    target_id = var.instanceattachment1_id
    port = 3000
}


resource "aws_alb_target_group_attachment" "ec2_web2_attach" {
    target_group_arn = aws_lb_target_group.kk-tg.arn
    target_id = var.instanceattachment2_id
    port = 3000
}


