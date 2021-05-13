FROM ruby:3.0.1


USER 1000:1000

WORKDIR /app

COPY http_server.rb .
CMD ["ruby", "http_server.rb"]
