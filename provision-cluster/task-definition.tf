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
    "image": "050543387869.dkr.ecr.eu-west-1.amazonaws.com/nginx",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80
      }
    ],
    "memory": 200,
    "cpu": 10
  },
  {
    "name": "laravel",
    "image": "050543387869.dkr.ecr.eu-west-1.amazonaws.com/laravel",
    "memory": 200,
    "cpu": 10

  }
]
DEFINITION
}
