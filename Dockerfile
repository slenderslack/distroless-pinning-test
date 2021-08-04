FROM clojure:openjdk-11-tools-deps-buster@sha256:47e9ca0e0642fed35a0f4a3ad6e1163df10cbcbe26c894754040f39d2a82eea9 AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11@sha256:97c7eae86c65819664fcb7f36e8dee54bbbbc09c2cb6b448cbee06e1b42df81b
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
