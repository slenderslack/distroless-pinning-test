FROM clojure:openjdk-11-tools-deps-buster@sha256:eab5dfa356ad3d567a5e6bd88c6d4646eb0e46574f8130a2e8bbf4a7d053053d AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11@sha256:ae5d32ed4da6d2207fd34accde64f5b1264cbdd1340fa8c1cfa70cdf1841f9db
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
