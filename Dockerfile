FROM golang:alpine as build
WORKDIR /go
ADD . /go
RUN CGO_ENABLED=0 go build -ldflags "-X main.VERSION=v0.0.12 -extldflags -static -s -w" -o /local-path-provisioner

FROM scratch
COPY --from=build /local-path-provisioner /
ENTRYPOINT [ "/local-path-provisioner" ]
