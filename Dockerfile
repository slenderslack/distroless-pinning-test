FROM clojure:openjdk-11-tools-deps-buster@sha256:76060274e9b9d24a929794fbdaad5740e6b79fba3422f585b47971e2226e0dd6 AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11@sha256:ae5d32ed4da6d2207fd34accde64f5b1264cbdd1340fa8c1cfa70cdf1841f9db
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
