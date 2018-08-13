FROM ruby:jessie

WORKDIR /app

# Install Zenaton
RUN apt-get update \
 && apt-get upgrade -y \
 && curl https://install.zenaton.com | sh \
 && apt-get clean

# Install dependencies
ADD Gemfile* ./
RUN bundle install

ENTRYPOINT ["./start_zenaton"]
