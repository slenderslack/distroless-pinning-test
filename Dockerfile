FROM clojure:openjdk-11-tools-deps-buster@sha256:bb31b5e5a7e7c96a9d5a0e1808cc09b814541823bcb01144a5bd9ec7c78dcd01 AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11@sha256:5b4bb0f378489f8b15547d79844a9e7b5343539051d99942f414872e380124a2
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
