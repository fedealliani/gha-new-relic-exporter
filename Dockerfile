FROM python:3.10-slim-buster

WORKDIR /app

COPY ./requirements.txt ./requirements.txt
ENV HTTP_PROXY=http://proxy.mgmt-dev.eu1:3128
ENV HTTPS_PROXY=http://proxy.mgmt-dev.eu1:3128
RUN /usr/local/bin/python -m pip install --upgrade pip

RUN pip3 install -r requirements.txt

COPY /src .

ENTRYPOINT [ "python3", "-u" , "/app/exporter.py"]
