FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /project
ADD Gemfile /project/Gemfile
ADD Gemfile.lock /project/Gemfile.lock
RUN bundle install
ADD . /project
