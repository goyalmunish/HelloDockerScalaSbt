FROM ubuntu:bionic

ENV SBT_VERSION 0.13.15

RUN \
  apt-get update -y && \
  apt-get install software-properties-common -y && \
  apt-get install curl -y

RUN \
  add-apt-repository ppa:webupd8team/java -y && \
  apt-get update && \
  apt-get -y install openjdk-8-jdk

RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

WORKDIR /HelloWorld

COPY . /HelloWorld

CMD sbt run
