FROM python:3-alpine
MAINTAINER Manuel Parra-Royon <manuel.parra@cern.ch> 

ARG BUILD_DATE
ARG VCS_REF

# Set labels (see https://microbadger.com/labels)
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/nikos/python3-alpine-flask-docker"

# Folder to semantics rules
RUN mkdir -p /semantics.rules/
# Folder to html datastore
RUN mkdir -p /htmlds/
# Folder to Flask APP
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# Dependencies of Python libraries
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY app/app.py /usr/src/app

# Expose the Flask port
EXPOSE 5000

CMD [ "python", "./app.py" ]
