FROM clojure:openjdk-11-tools-deps-buster@sha256:4ac3dfceff43f4b55cee708b54d20b633849d01e8ea026a185c4c8a7f3aa460b AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
