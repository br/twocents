FROM registry.bleacherreport.com:5000/elixir1.6.4:latest
MAINTAINER Mariko Sampaga <mariko.sampaga@bleacherreport.com>

ADD . /app

WORKDIR /app

RUN rm -rf _build deps

EXPOSE 4000

ENV PORT 4000

ENV MIX_ENV test

RUN apk --update --no-cache add --virtual .app-build make && \
    apk --update --no-cache add git && \
    apk add --no-cache build-base && \
    apk add postgresql-client && \
    apk del .app-build

RUN mix local.hex --force && mix local.rebar --force && \
    mix do deps.clean mime --build, deps.get, compile, compile.protocols

RUN apk update && \
    apk add nodejs-npm

RUN apk add --no-cache openssl

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN npm install brunch -g && brunch build --production assets/

CMD ["mix", "phoenix.server"]
