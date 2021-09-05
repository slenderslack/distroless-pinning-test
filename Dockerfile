FROM clojure:openjdk-11-tools-deps-buster@sha256:ba72abd87d4742df9a9ab42c25153131721bcc6634f0ed8f39c36bcacf9a1c6a AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
