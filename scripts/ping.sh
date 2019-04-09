#!/bin/bash

ping -i 1 api.smart-connect.cloud | xargs -L 1 -I '{}' date '+%Y-%m-%d %H:%M:%S: {}' | tee ~/Downloads/ping.txt
