FROM node:10.19.0-alpine

EXPOSE 8080

RUN adduser --home /usr/local/app --disabled-password --uid 1001 app
RUN apk update && apk add dumb-init
CMD ["boot"]
ENTRYPOINT ["/usr/bin/dumb-init", "/usr/local/app/docker-entrypoint.sh"]
RUN mkdir -p /usr/local/app

COPY docker-entrypoint.sh /usr/local/app
RUN chown -R app /usr/local/app
USER app

WORKDIR /usr/local/app
ADD src /usr/local/app/src
