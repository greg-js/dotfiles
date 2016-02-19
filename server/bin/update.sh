#!/bin/bash

apt-get update &> /dev/null

if [ $? == 0 ]; then
  echo "Successfully ran apt-get update"
else
  echo "Ran apt-get update with errors, check connection"
fi
