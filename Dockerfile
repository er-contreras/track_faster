FROM ruby:3.4-slim

# System deps
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev postgresql-client && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /track_faster

# Install gems
COPY Gemfile Gemfile.lock ./

ENV BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT="development test" \
    BUNDLE_DEPLOYMENT=true

RUN bundle install

# Copy app
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY . .

# Rack / Puma listens here
EXPOSE 9292

# CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]
ENTRYPOINT ["/entrypoint.sh"]
