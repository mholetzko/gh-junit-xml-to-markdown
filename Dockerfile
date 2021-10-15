# Container image that runs your code
FROM python:3-alpine

WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh

RUN echo "Create venv"
RUN python -m venv env

RUN echo "Install requirements"
COPY src/requirements.txt /app/src/requirements.txt

RUN echo "Install deps"
RUN source /app/env/bin/activate && python3 -m pip install -r ./src/requirements.txt

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]