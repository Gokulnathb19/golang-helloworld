FROM ubuntu:20.10
COPY output/* /output/
WORKDIR /apps/hello-world
COPY helloworld .
ENTRYPOINT ["./helloworld"]
