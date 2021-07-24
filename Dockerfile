FROM clojure:openjdk-11-tools-deps-buster@sha256:6921861cac83bfcc80319e711bda2f903ca883a9db70e716e38699fab1a254ca AS builder

ADD . /app
WORKDIR /app
RUN clojure -X:uberjar

FROM gcr.io/distroless/java-debian10:11
COPY --from=builder /app /app
WORKDIR /app
CMD ["test-app.jar"]
