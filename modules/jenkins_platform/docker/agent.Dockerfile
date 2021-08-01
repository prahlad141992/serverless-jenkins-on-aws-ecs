FROM jenkins/inbound-agent:alpine
USER root
ARG AWS_CLI_VERSION=1.19.85
RUN apk --no-cache add python3 py3-pip git curl \
    && ln -s /usr/bin/python3 /usr/bin/python
RUN pip3 install awscli==${AWS_CLI_VERSION}

# run image as jenkins user
USER jenkins
