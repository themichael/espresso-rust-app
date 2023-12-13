# espresso-rust-app
A simple pipeline that builds and containerizes a rust program using docker.


## Workflow
The workflow uses cargo to build and test the compiled rust application.
Then I have the artifact uploaded with the build run number for convenience.
I created secrets to be used to login to ghcr so I can build and push the image.

## Dockerfile
I wanted to create a multi-stage build where the first stage compiles the application and is moved to the second stage so the image would be smaller,
but the instructions did say to use workflow to do the application binary.
I added this:
```

  LABEL org.opencontainers.image.source="https://github.com/themichael/espresso-rust-app"

```
to the dockerfile so the image can be in this public repo.
Other than that the Dockerfile is very simple.

## Terraform
For the Terraform part I decided to use AWS ECS Fargate to run my image. 
I first create vpc with all the subnetting.
Then I created the ecs cluster along with its service and task definition where I define my docker image and its cpu/memory capacities.
Since the scrips are short and only have 1 function I did not make or use modules.




