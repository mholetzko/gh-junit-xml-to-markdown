# Container image that runs your code
FROM python:3-alpine

WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh

RUN echo "Install requirements"
COPY src/ /app/src/

RUN echo "Create venv" \
&& python3 -m venv /app/env

RUN echo "Install deps" \
&& source /app/env/bin/activate \
&& python3 -m pip install -r ./src/requirements.txt --no-cache-dir

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/app/entrypoint.sh"]