# Setup build arguments with default versions
ARG TERRAFORM_VERSION=1.0.3
FROM jenkins/jenkins:alpine
USER root

#python
ARG AWS_CLI_VERSION=1.19.85
RUN apk add --no-cache python3 py3-pip  \
    && ln -s /usr/bin/python3 /usr/bin/python
RUN pip3 install awscli==${AWS_CLI_VERSION}

# jenkins piece start from here
USER jenkins
#RUN jenkins-plugin-cli --plugins "blueocean:1.24.7"

