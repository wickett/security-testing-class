#!/usr/bin/env bash

ip addr show docker0 | grep -Po 'inet \K[\d.]+'


echo "default: TARGET_HOSTNAME=travis" > ./config/cucumber.yml
