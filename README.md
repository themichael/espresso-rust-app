# espresso-rust-app
A simple pipeline that builds and containerizes a rust program using docker.


## Workflow
The workflow uses cargo to build and test the compiled rust application.
Then I have the artifact uploaded with the build run number for convenience.
I created secrets to be used to login to ghcr so I can build and push the image.

## Dockerfile
## Dockerfile
I wanted to use an alpne image to run the binary but I didnt really have time to fix the issue of the binary not
running in the alpine container because I need to compile the binary with --target=x86_64-unknown-linux-musl but 
i might fix this issue before you read this
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




