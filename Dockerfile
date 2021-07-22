FROM clojure:openjdk-11-tools-deps-buster@sha256:68f719e0a91afb1d986f685368a8088def0bde0f4d15d9eeee52429dbd01649d AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
