FROM python:3.9-slim

ADD /looker_code /looker_code

RUN apt update
RUN apt -y install ruby ruby-dev
RUN gem install gazer

RUN pip install looker-deployer

CMD mkdir looker_export

CMD ldeploy content export --env dev  --ini /looker_code/looker.ini  --folders 146 --local-target /looker_export/

CMD ls looker_export/Shared/'Looker SDK Test'
