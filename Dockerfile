FROM ruby:2.7.1

RUN apt-get update && apt-get install -y lsb-release

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' &&\
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - &&\
  apt-get update &&\
  apt-get -y install postgresql

WORKDIR /app

COPY Gemfile /app/
COPY Gemfile.lock /app/

ENV RACK_ENV development

RUN gem install bundler:2.1.4
RUN bundle install --jobs 2 --retry 2

COPY . /app/