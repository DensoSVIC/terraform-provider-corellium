FROM golang:1.24.3-alpine AS builder

WORKDIR /src
COPY . .
RUN go install

FROM hashicorp/terraform:latest

COPY --from=builder /go/bin/ /go/bin/
COPY .terraformrc /root/
