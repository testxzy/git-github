FROM python:3.9-slim

ADD /looker_code /looker_code

RUN apt update
RUN apt -y install ruby ruby-dev
RUN gem install gazer

RUN pip install looker-deployer

RUN mkdir looker_export

RUN ldeploy content export --env dev  --ini /looker_code/looker.ini  --folders 146 --local-target /looker_export/

RUN ls looker_export/Shared/'Looker SDK Test'
