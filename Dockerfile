FROM clojure:openjdk-11-tools-deps-buster@sha256:062c1d2e9b5e607e555fc37302c1d572bbbe7ec0b12fe46b74a3122e85482eff AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
