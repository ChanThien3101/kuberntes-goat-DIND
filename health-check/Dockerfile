FROM golang:buster
LABEL MAINTAINER="Madhu Akula" INFO="Kubernetes Goat"

WORKDIR /

COPY views /views
COPY go.mod /go.mod
COPY go.sum /go.sum
COPY main.go /main.go
COPY data /data


RUN apt update && apt install curl wget iputils-ping -y
RUN tar -xvf /data/docker-19.03.9.tgz -C /
RUN go build -o /

EXPOSE 80

CMD ["/health-check"]
