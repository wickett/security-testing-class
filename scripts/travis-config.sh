#!/usr/bin/env bash

TRAVIS=ip addr show docker0 | grep -Po 'inet \K[\d.]+'


echo "default: TARGET_HOSTNAME=$TRAVIS" > ./config/cucumber.yml
