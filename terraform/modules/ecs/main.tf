resource "aws_iam_role" "exec_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "exec_policy" {
  role       = aws_iam_role.exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_cluster" "app_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "ecs_td" {
  family                   = "ecs-task-family"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.exec_role.arn
  task_role_arn            = aws_iam_role.exec_role.arn

  container_definitions = jsonencode([
    {
      name      = var.ecs_cluster_name
      image     = var.container_image
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ],
      essential = true
    }
  ])
}

resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.ecs_td.arn
  cluster         = aws_ecs_cluster.app_cluster.arn
  desired_count   = var.desired_count

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [var.ecs_sg_id]
    assign_public_ip = true
  }

  depends_on = [
    aws_ecs_task_definition.ecs_td,
    aws_iam_role_policy_attachment.exec_policy
  ]
}