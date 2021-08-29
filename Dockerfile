FROM clojure:openjdk-11-tools-deps-buster@sha256:b778e828ed3c29422ac205687a328e014059d4c9c9074c907aecb716c9b6f919 AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
