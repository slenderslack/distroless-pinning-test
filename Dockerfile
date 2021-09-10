FROM clojure:openjdk-11-tools-deps-buster@sha256:bb31b5e5a7e7c96a9d5a0e1808cc09b814541823bcb01144a5bd9ec7c78dcd01 AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11@sha256:6bd00235394af1c60837da54d6d8b50ae903f3abecce7c1880ea3601688c570d
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
