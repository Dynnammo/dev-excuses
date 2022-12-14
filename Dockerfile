FROM crystallang/crystal:latest as builder
WORKDIR /workdir
COPY ./shard.yml ./shard.lock .
RUN shards install

COPY ./src/ .
RUN crystal build --release --static dev-excuses.cr

FROM busybox
WORKDIR /app
EXPOSE 8080
ENV PORT 8080
ENV KEMAL_ENV production
COPY --from=builder /workdir/dev-excuses .
COPY --from=builder /workdir/data ./src/data
CMD exec ./dev-excuses -p $PORT

