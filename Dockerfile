FROM ruby:2.5.1-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk add --no-cache --update postgresql-dev build-base tzdata
RUN rm -rf /var/cache/apk/*

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=false
ENV RAILS_LOG_TO_STDOUT=true

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
# RUN bundle config --global frozen 1
RUN bundle config build.pg --use-system-libraries 
RUN bundle config --delete without
RUN bundle install --binstubs --without development test

COPY . /usr/src/app

CMD ["puma"]