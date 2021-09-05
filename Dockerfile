FROM clojure:openjdk-11-tools-deps-buster@sha256:ba72abd87d4742df9a9ab42c25153131721bcc6634f0ed8f39c36bcacf9a1c6a AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11@sha256:d037e7d163de48d0be1bcbfb4b864295ce78d7f09d4105a13dba441053409528
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
