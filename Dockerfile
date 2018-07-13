FROM registry.bleacherreport.com:5000/elixir1.5.1:alpine
MAINTAINER Mariko Sampaga <mariko.sampaga@bleacherreport.com>

ADD . /app

WORKDIR /app

RUN rm -rf _build deps

EXPOSE 4000

ENV PORT 4000

ENV MIX_ENV prod

RUN apk --update --no-cache add --virtual .app-build make && \
    apk --update --no-cache add git && \
    mix local.hex --force && mix local.rebar --force && \
    mix do deps.clean mime --build, deps.get, compile, compile.protocols && \
    apk add --no-cache build-base && \
    apk add postgresql-client && \
    apk del .app-build

#RUN npm install brunch -g && brunch build --production assets/

CMD ["mix", "phoenix.server"]
