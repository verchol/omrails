FROM ruby:2.2.3
RUN apt-get update
RUN apt-get -q -y install node
RUN mkdir /usr/src/app
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install
COPY . /usr/src/app
