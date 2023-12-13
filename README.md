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
{
  LABEL org.opencontainers.image.source="https://github.com/themichael/espresso-rust-app"
}
```
to the dockerfile so the image can be in this public repo



