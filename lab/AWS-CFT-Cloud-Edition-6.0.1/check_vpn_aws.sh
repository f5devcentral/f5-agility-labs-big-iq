#!/bin/bash
# Uncomment set command below for code debuging bash
#set -x

aws ec2 describe-vpn-connections --output json | grep -A 15 VgwTelemetry

exit 0
