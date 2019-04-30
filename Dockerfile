# 
FROM ubuntu:18.04

MAINTAINER Bill Gercken <bgercken@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    && apt-get install -y -q build-essential python2.7 libicu-dev libreadline-dev libssl-dev zlib1g-dev git-core curl cmake libxml2-dev \
    && apt-get install -y ruby ruby-dev git vim \
    && apt-get clean \
    &&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Install gollum and dependencies and setup data dir.
RUN gem install nokogiri \
    && gem install gollum --no-document \
    && gem install gimli --no-document \
    && mkdir -p /usr/local/share/wikidata \
    && git init /usr/local/share/wikidata

# Expose default gollum port 4567
EXPOSE 4567

#
ADD ./run_gollum.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/run_gollum.sh"]

