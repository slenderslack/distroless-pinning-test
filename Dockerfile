FROM clojure:openjdk-11-tools-deps-buster@sha256:062c1d2e9b5e607e555fc37302c1d572bbbe7ec0b12fe46b74a3122e85482eff AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11@sha256:0e4857106b8bfad3f7d1b0efc2dcbbd82eee6b678b5b78663ee5447ae9c0b33d
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
