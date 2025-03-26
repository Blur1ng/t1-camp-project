FROM golang:1.23.7-bookworm AS stage

RUN mkdir /app
WORKDIR /app

COPY ./go.mod /app
COPY ./go.sum /app

RUN go mod download

COPY ./ /app

RUN go build

FROM debian:12.10

COPY --from=stage /app/pig /pig

EXPOSE 8000
CMD /pig