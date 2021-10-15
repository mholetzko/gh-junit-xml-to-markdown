#!/bin/sh -l

echo "Create venv"
python3 -m venv env
echo "Activate venv"
source ./env/bin/activate
echo "Install requirements"

echo "Received who-to-greet: $1"
echo "Received upload-to-wiki: $2"

