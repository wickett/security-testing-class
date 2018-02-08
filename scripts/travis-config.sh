#!/usr/bin/env bash

TRAVIS_IP=$(ip addr show docker0 | grep -Po 'inet \K[\d.]+')


echo "default: TARGET_HOSTNAME=$TRAVIS_IP" > ./config/cucumber.yml
