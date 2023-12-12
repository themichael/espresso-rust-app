FROM rust:latest
LABEL org.opencontainers.image.source="https://github.com/themichael/espresso-rust-app"
WORKDIR /myapp
COPY ./target/debug/hello_world .
RUN ls -l
RUN chmod +x hello_world
CMD ["./hello_world"]