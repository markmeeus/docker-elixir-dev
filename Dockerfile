FROM ubuntu:18.04

MAINTAINER Mark Meeus <mark.meeus@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -qq update && \
    apt-get install -y devscripts && \
    rmadison elixir && \
    apt-get install -y curl git locales tzdata && \
    locale-gen "en_US.UTF-8" && \
    export LANG=en_US.UTF-8 && \
    curl -o /tmp/erlang.deb http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i /tmp/erlang.deb && \
    rm -rf /tmp/erlang.deb && \
    (curl -sL https://deb.nodesource.com/setup_10.x | bash)

RUN apt-get update && \
    apt-get install -y erlang && \
    apt-get install -y elixir=1.7\* && \
    apt-get install -y nodejs && \
    apt-get clean -y && \
    rm -rf /var/cache/apt/*

ENV LANG=en_US.UTF-8

RUN mix local.hex --force && \
    mix local.rebar --force
