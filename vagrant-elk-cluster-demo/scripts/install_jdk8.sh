#!/bin/bash

# install Java
apt-get -qq purge openjdk*
add-apt-repository -y ppa:openjdk-r/ppa 2>&1
apt-get update -qq

echo "Installing jdk8."
apt-get install -y -qq openjdk-8-jdk