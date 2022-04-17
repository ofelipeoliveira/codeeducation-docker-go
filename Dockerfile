# Alpine is chosen for its small footprint
# compared to Ubuntu
FROM golang:1.18.1-alpine3.15 AS builder

WORKDIR /app
COPY src/main.go ./
RUN go build main.go


FROM scratch
COPY --from=builder /app/main .
CMD ["/main"]