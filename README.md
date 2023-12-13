# espresso-rust-app
A simple pipeline that builds and containerizes a rust program using docker.


## Workflow
The workflow uses cargo to build and test the compiled rust application.
Then I have the artifact uploaded with the build run number for convenience.
I created secrets to be used to login to ghcr so I can pull the build and push the image.

