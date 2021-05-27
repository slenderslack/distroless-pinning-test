FROM clojure:openjdk-11-tools-deps-buster@sha256:db2282764485a5d46bae4f372ce36d6c1c04dc2f5d10ec2eac514188d0c5d16d AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11@sha256:ae5d32ed4da6d2207fd34accde64f5b1264cbdd1340fa8c1cfa70cdf1841f9db
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
