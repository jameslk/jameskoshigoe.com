# syntax=docker/dockerfile:1
FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Configure the main process to run when running the image
CMD ["bundle", "exec", "jekyll", "build"]
