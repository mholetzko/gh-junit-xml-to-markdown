#!/bin/sh -l

python3 -m venv env
source ./env/bin/activate

echo "Received who-to-greet: $1"
echo "Received upload-to-wiki: $2"

