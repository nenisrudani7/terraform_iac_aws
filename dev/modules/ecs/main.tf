# CloudWatch Log Group

resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/ecs-sample"
  retention_in_days = 7
  tags = {
    Environment = var.env
  }
}


# # Security Group for ALB

# resource "aws_security_group" "alb_sg" {
#   name        = "${var.env}-ecs-alb-sg"
#   description = "ALB security group"
#   vpc_id      = data.aws_vpc.default.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Environment = var.env
#   }
# }


# # Security Group for ECS tasks

# resource "aws_security_group" "ecs_sg" {
#   name        = "${var.env}-ecs-sg"
#   description = "ECS tasks security group"
#   vpc_id      = modu

#   ingress {
#     from_port       = 80
#     to_port         = 80
#     protocol        = "tcp"
#     security_groups = [aws_security_group.alb_sg.id]
#     description     = "Allow ALB to reach ECS"
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Environment = var.env
#   }
# }


# ALB

resource "aws_lb" "ecs_alb" {
  name               = "${var.env}ecs-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.vpc.security_group_id]
  subnets            = module.vpc.subnet_id

  tags = {
    Environment = var.env
  }
}


# Target Group

resource "aws_lb_target_group" "ecs_tg" {
  name        = "${var.env}-ecs-tg"
  port        = var.elb_target_port
  protocol    = var.protocol
  vpc_id      = module.vpc.vpc_id
  target_type = var.target_type

  health_check {
    enabled = true
    # path                = "/health" 
    path                = var.healthcheck_path
    protocol            = var.protocol
    interval            = var.interval_time_second
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
  }

  tags = {
    Environment = var.env
  }
}


# Listener

resource "aws_lb_listener" "ecs_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = var.elb_target_port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
}


# ECS Cluster

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.env}-ecs-farget"
}


# ECS Task Execution Role

# resource "aws_iam_role" "ecs_task_execution_role" {
#   name = "${var.env}-ecsTaskExecutionRole1"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "ecs-tasks.amazonaws.com"
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_attach" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }


# ECS Task Definition

resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "${var.env}-ecs-task"
  cpu                      = var.cpu_size
  memory                   = var.memory_size
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = module.iam_role.role_arn

  container_definitions = jsonencode([
    {
      name      = var.task_defination_name
      image     = var.image
      essential = true
      portMappings = [
        {
          containerPort = var.containerport
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs_log_group.name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}


# ECS Service

resource "aws_ecs_service" "ecs_service" {
  name            = "${var.env}-ecs-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = data.aws_subnets.default.ids
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = var.container_name
    container_port   = var.containerport
  }

  deployment_minimum_healthy_percent = var.deployment_minimum_percentage
  deployment_maximum_percent         = var.deployment_maximum_percent

  tags = {
    Environment = var.env
  }
}


# Auto Scaling for ECS Service

resource "aws_appautoscaling_target" "ecs_scaling_target" {
  max_capacity       = var.maxtask
  min_capacity       = var.mintask
  resource_id        = "service/${aws_ecs_cluster.ecs_cluster.name}/${aws_ecs_service.ecs_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "ecs_scaling_policy" {
  name               = "${var.env}-ecs-cpu-scaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_scaling_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_scaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_scaling_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value       = var.cpuutilization_percentage
    scale_in_cooldown  = var.scalintime
    scale_out_cooldown = var.scalouttime
  }
}
