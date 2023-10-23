FROM dart:latest

# Copy all the source code
COPY ./config /app/config
COPY ./lib /app/lib
COPY ./bin /app/bin
COPY ./web /app/web
COPY ./*.yaml /app/

WORKDIR /app
RUN dart pub upgrade

# Optionally build generated sources.
# RUN pub run build_runner build

# Set environment, start server in JIT mode
ENV ANGEL_ENV=production
EXPOSE 8080
CMD dart ./bin/prod.dart -p 8080 -a 0.0.0.0

# Use -j flag to set higher number of isolates
#CMD dart ./bin/prod.dart -p 3000 -a 0.0.0.0 -j 50