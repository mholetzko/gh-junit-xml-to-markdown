#!/bin/sh -l


echo "Received data path: $1"
echo "Received upload-to-wiki: $2"
source ./env/bin/activate && python3 src/convert_junit_to_md.py $1 TESTRUN-123 www.google.com

path_to_generated_md="conterved.md"

