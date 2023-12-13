resource "aws_ecs_cluster" "ecs_cluster" {
 name = var.cluster_name
}



resource "aws_ecs_service" "ecs_service" {
 name            = var.cluster_name
 cluster         = aws_ecs_cluster.ecs_cluster.id
 task_definition = aws_ecs_task_definition.ecs_task_definition.arn
 desired_count   = 1
 launch_type     = "FARGATE"




 network_configuration {
   subnets         = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
   security_groups = [aws_security_group.security_group.id]
   assign_public_ip = false
 }
  triggers = {
   redeployment = timestamp()
 }
}


resource "aws_ecs_task_definition" "ecs_task_definition" {
 family             = "my-ecs-task"
 network_mode       = "awsvpc"
 execution_role_arn = var.execution_role
 cpu                = 256
 requires_compatibilities = ["FARGATE"]
 memory                   = 2048

 container_definitions = jsonencode([
   {
     name      = "espresso-rust"
     image     = var.image_name
     cpu       = 256
     memory    = 2048
     essential = true
     portMappings = [
       {
         containerPort = 80
         hostPort      = 80
         protocol      = "tcp"
       }
    ]
   }
 ])
} 