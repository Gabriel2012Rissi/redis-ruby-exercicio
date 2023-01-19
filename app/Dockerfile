FROM ruby:3.2.0-alpine

# Set environment variables
ENV APP_DIR /usr/src/app

# Update and install dependencies
RUN apk update \
    && apk upgrade \
    && apk add --no-cache alpine-sdk \
                          bash

# Create and select app directory
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}

# Copy gemfiles and install gems
COPY Gemfile* ${APP_DIR}/
RUN bundle install

# Copy app files
COPY . ${APP_DIR}

# Execute app
ENTRYPOINT ["bundle", "exec", "ruby", "app.rb"]