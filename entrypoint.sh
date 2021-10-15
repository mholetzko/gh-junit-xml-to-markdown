#!/bin/sh -l


echo "Received data path: $1"
echo "Received result path: $2"
source /app/env/bin/activate && python3 src/convert_junit_to_md.py $1 TESTRUN-123 www.google.com
ls -al
pwd

echo "Print md"
cat converted.md

echo "create outdir"
mkdir ./$2

echo "copy"
mv converted.md ./$2/converted.md

out=./$2/converted.md
echo "::set-output name=path_to_generated_md::$out"

