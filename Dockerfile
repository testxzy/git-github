FROM python:3.9-slim

ADD /looker_code /looker_code

RUN apt update
RUN apt -y install ruby ruby-dev
RUN gem install gazer

RUN pip install looker-deployer

RUN mkdir looker_export

#testing.. folder 146 = Looker SDK Test
RUN ldeploy content export --env dev  --ini /looker_code/looker.ini  --folders 116 --local-target /looker_export/

RUN ls looker_export/Shared/'Looker SDK Test'

RUN ldeploy content import --env prd  --ini /looker_code/looker.ini  --folders  /looker_export/Users/ --recursive --target-folder Shared/'Looker SDK Test'/migrated_content
