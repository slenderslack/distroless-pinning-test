FROM clojure:openjdk-11-tools-deps-buster@sha256:bb31b5e5a7e7c96a9d5a0e1808cc09b814541823bcb01144a5bd9ec7c78dcd01 AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
