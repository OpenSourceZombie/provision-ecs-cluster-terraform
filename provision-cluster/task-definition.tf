data "aws_ecs_task_definition" "laraveltest" {
  task_definition = "${aws_ecs_task_definition.laraveltest.family}"
}

resource "aws_ecs_task_definition" "laraveltest" {
    family                = "hello_world"
    container_definitions = <<DEFINITION
[
  {
    "name": "nginx",
    "links": [
      "laravel"
    ],
    "image": "nginx",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 500,
    "cpu": 10
  },
  {
    "name": "laravel",
    "image": "laravel",
    "cpu": 10,
    "memory": 500,
    "essential": true
    "memory": 500,
    "cpu": 10

  }
]
DEFINITION
}
