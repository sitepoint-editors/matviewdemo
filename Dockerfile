FROM ruby:2.2.2

RUN apt-get update -yqq && apt-get install -y build-essential

EXPOSE 3000

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev
# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

RUN mkdir /app

WORKDIR /tmp
COPY Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 3

ADD . /app
WORKDIR /app

CMD ["rails", "server", "-b", "0.0.0.0"]
