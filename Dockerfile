FROM golang:1.20@sha256:cfc9d1b07b1ef4f7a4571f0b60a99646a92ef76adb7d9943f4cb7b606c6554e2 AS builder

COPY . /build

RUN cd /build && \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w' .

FROM gcr.io/distroless/base-debian11@sha256:73deaaf6a207c1a33850257ba74e0f196bc418636cada9943a03d7abea980d6d

COPY --from=builder /build/go-kdcproxy /app/go-kdcproxy

ENV KDC_PROXY_LISTEN=:8080

EXPOSE 8080

ENTRYPOINT [ "/app/go-kdcproxy" ]
