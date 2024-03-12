# Base image
FROM --platform=linux/amd64 alpine:latest

# installes required packages for our script
RUN apk add --no-cache bash wget

# Install parlay
RUN wget https://github.com/snyk/parlay/releases/download/v0.1.4/parlay_Linux_x86_64.tar.gz 
RUN tar -xvf parlay_Linux_x86_64.tar.gz 

RUN mv parlay /usr/bin/parlay

RUN ls /usr/bin
RUN parlay



# Copies your code file  repository to the filesystem
COPY . .

# change permission to execute the script and
RUN chmod +x ./parlay.sh

# file to execute when the docker container starts up
ENTRYPOINT ["/parlay.sh"]