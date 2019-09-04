#!/bin/bash

ssh -D 9999 jeremy.shi@bastion.staging.string.exchange -A
echo "bastion set"
hpts -s 127.0.0.1:9999 -p 8888
