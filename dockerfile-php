# base image
FROM ubuntu:20.04

#input GitHub runner version argument
ENV DEBIAN_FRONTEND=noninteractive

# update the base packages + add a non-sudo user
RUN apt-get update -y && apt-get upgrade -y && useradd -m docker

RUN apt-get install sudo -y

RUN usermod -aG sudo docker

RUN echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# install the packages and dependencies along with jq so we can parse JSON (add additional packages as necessary)
RUN apt-get install -y --no-install-recommends \
    curl nodejs wget unzip vim git azure-cli jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip

# cd into the user directory, download and unzip the github actions runner
RUN cd /home/docker && mkdir temp && cd temp \
    && curl -O -L https://github.com/actions/runner/releases/download/v2.296.2/actions-runner-linux-x64-2.296.2.tar.gz \
    && tar xzf ./actions-runner-linux-x64-2.296.2.tar.gz

# install some additional dependencies
RUN chown -R docker ~docker && /home/docker/temp/bin/installdependencies.sh

# RUN DESPUES
RUN curl -s https://deb.nodesource.com/setup_16.x | bash

RUN apt install nodejs -y

RUN npm install -g pm2

ADD scripts/start.sh start.sh

RUN chmod +x start.sh

USER docker

ENTRYPOINT ["./start.sh"]