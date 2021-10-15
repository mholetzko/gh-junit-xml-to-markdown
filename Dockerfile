# Container image that runs your code
FROM python:3-alpine

RUN echo "Create venv"
RUN python -m venv env
RUN echo "Activate venv"
RUN source ./env/bin/activate
RUN echo "Install requirements"
RUN python3 -m pip install -r src/requirements.txt

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]