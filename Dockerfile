FROM clojure:openjdk-11-tools-deps-buster@sha256:76060274e9b9d24a929794fbdaad5740e6b79fba3422f585b47971e2226e0dd6 AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
