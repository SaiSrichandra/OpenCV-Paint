# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN apt-get -y update

RUN apt-get install -y build-essential

RUN apt-get install -y libc6

RUN pip3 install -r requirements.txt

COPY . .

RUN apt-get -y install libavdevice-dev libavfilter-dev libopus-dev libvpx-dev pkg-config libsrtp2-dev

CMD ["python3", "server.py"]

# CMD ["ls", "-l"]