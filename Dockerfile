FROM clojure:openjdk-11-tools-deps-buster@sha256:8c3f9d6610a5c110d55fe8b70a78a6fe63ef7857191e2ce393ed668a0997f179 AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
