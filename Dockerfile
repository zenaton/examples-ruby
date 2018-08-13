FROM ruby:jessie

WORKDIR /app

# Install Zenaton
RUN curl https://install.zenaton.com | sh

# Install dependencies
ADD Gemfile* ./
RUN bundle install

ENTRYPOINT ["./start_zenaton"]
