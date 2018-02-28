FROM ubuntu:14.04

MAINTAINER Mark Meeus <mark.meeus@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -qq update && \
    apt-get -y install devscripts && \
    rmadison elixir && \
    apt-get -y install curl locales && \
    locale-gen "en_US.UTF-8" && \
    export LANG=en_US.UTF-8 && \
    curl -o /tmp/erlang.deb http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i /tmp/erlang.deb && \
    rm -rf /tmp/erlang.deb && \
    (curl -sL https://deb.nodesource.com/setup_6.x | bash)
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y erlang
RUN apt-get install -y elixir
RUN apt-get install -y nodejs
RUN apt-get clean -y && \
    rm -rf /var/cache/apt/*

ENV LANG=en_US.UTF-8

RUN mix local.hex --force && \
    mix local.rebar --force

