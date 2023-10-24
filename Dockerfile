FROM dart:latest

COPY ./config /app/config
COPY ./lib /app/lib
COPY ./bin /app/bin
COPY ./web /app/web
COPY ./*.yaml /app/

WORKDIR /app
RUN dart pub upgrade

ENV ANGEL_ENV=production
EXPOSE 8080
CMD dart ./bin/prod.dart -p 8080 -a 0.0.0.0

#... -a 0.0.0.0 -j 50