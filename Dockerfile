FROM clojure:openjdk-11-tools-deps-buster@sha256:adfe8b50cb0844f32b72d636b04b9ebcd8fd0c55d111d93aa42e303c549a1fed AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
