FROM golang:1.8beta1-alpine AS builder

WORKDIR /src/

COPY hello.go .

RUN go build hello.go

FROM scratch

COPY --from=builder /src /

ENTRYPOINT ["./hello"]