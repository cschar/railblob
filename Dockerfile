FROM centurylink/alpine-rails

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app 
WORKDIR /app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development test

# Set Rails to run in production
ENV RAILS_ENV production 
ENV RACK_ENV production

ENV S3_ACCESS_KEY ${S3_ACCESS_KEY}
ENV S3_SECRET_KEY ${S3_SECRET_KEY}
ENV S3_BUCKET ${S3_BUCKET}

# Copy the main application.
COPY . ./

# Precompile Rails assets
RUN bundle exec rake assets:precompile

# Start puma
CMD bundle exec puma -C config/puma.rb
