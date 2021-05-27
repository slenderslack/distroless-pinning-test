FROM clojure:openjdk-11-tools-deps-buster@sha256:db2282764485a5d46bae4f372ce36d6c1c04dc2f5d10ec2eac514188d0c5d16d AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
