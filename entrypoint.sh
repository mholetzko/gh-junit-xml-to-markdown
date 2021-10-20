#!/bin/sh -l


echo "Received FILEPATH: $1"
FILEPATH=$1
echo "Received SUITENAME: $2"
SUITENAME=$2
RESULT_FILENAME=$SUITENAME.md
echo "Received DEATILS_URL: $3"
DEATILS_URL=$3
echo "Received RESULT_FILENAME: $RESULT_FILENAME"
echo "Received RESULT_PATH: $4"
RESULT_PATH=$4
echo "Received VENV_PATH: $5"
VENV_PATH="$5/bin/activate"

echo "Inspect dir"
ls -al .

echo "Convert"
source "$VENV_PATH" && python3 ./src/convert_junit_to_md.py $FILEPATH $SUITENAME $DEATILS_URL

echo "Print md"
cat ./converted.md

echo "Rename"
mv ./converted.md ./$RESULT_FILENAME

echo "create outdir"
mkdir ./$RESULT_PATH

echo "Copy"
mv ./$RESULT_FILENAME ./$RESULT_PATH/$RESULT_FILENAME 

out=./$RESULT_PATH/$RESULT_FILENAME
echo "::set-output name=path_to_generated_md::$out"

