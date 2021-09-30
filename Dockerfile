FROM clojure:openjdk-11-tools-deps-buster@sha256:ee3dff2a36cfc33b956a74c3cfc6b739ca22b12b8cef6c69a3fa5d3f69c3b23b AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
