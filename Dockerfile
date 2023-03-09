FROM python:3.9-slim

RUN apt update
RUN apt -y install ruby ruby-dev
RUN gem install gazer

RUN pip install looker-deployer

CMD ldeploy
