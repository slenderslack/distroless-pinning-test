FROM clojure:openjdk-11-tools-deps-buster@sha256:eab5dfa356ad3d567a5e6bd88c6d4646eb0e46574f8130a2e8bbf4a7d053053d AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
