FROM clojure:openjdk-11-tools-deps-buster@sha256:47e9ca0e0642fed35a0f4a3ad6e1163df10cbcbe26c894754040f39d2a82eea9 AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
