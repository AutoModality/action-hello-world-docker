FROM alpine@sha256:2171658620155679240babee0a7714f6509fae66898db422ad803b951257db78

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]