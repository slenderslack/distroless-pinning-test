FROM clojure:openjdk-11-tools-deps-buster@sha256:8c3f9d6610a5c110d55fe8b70a78a6fe63ef7857191e2ce393ed668a0997f179 AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11@sha256:ae5d32ed4da6d2207fd34accde64f5b1264cbdd1340fa8c1cfa70cdf1841f9db
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
