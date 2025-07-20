FROM golang:1.23.7-alpine AS stage
WORKDIR /app
COPY go.sum go.mod ./
RUN go mod download
COPY . .
RUN go build -o goapp .


FROM alpine:3.20
WORKDIR /app
COPY --from=stage /app/goapp .