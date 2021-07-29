FROM clojure:openjdk-11-tools-deps-buster@sha256:6921861cac83bfcc80319e711bda2f903ca883a9db70e716e38699fab1a254ca AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11@sha256:0642c4188a6f019afdb7774c265a6aa09e276805985628a67aedda212195ff9b
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
