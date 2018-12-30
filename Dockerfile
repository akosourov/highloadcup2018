FROM centos:7

WORKDIR /root

RUN yum install -y wget && \
    wget https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf go1.11.4.linux-amd64.tar.gz && \
    mkdir go go/src go/pkg go/bin go/src/app

ENV PATH={PATH}:/usr/local/go/bin GOROOT=/usr/local/go GOPATH=/root/go

ADD main.go go/src/app

RUN go build app && go install app

EXPOSE 80

CMD ./go/bin/app