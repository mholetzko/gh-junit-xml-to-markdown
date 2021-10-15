#!/bin/sh -l


echo "Received who-to-greet: $1"
echo "Received upload-to-wiki: $2"
python3 -m src/convert_junit_to_md.py ./result.xml TESTRUN-123 www.google.com
path-to-generated-md="conterved.md"

