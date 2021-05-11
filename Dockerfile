FROM ruby:3.0.1

WORKDIR /app

COPY http_server.rb .
CMD ["ruby", "http_server.rb"]
