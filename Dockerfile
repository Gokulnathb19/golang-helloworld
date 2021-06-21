FROM ubuntu:20.10
WORKDIR /apps/hello-world
COPY helloworld .
ENTRYPOINT ["./helloworld"]
