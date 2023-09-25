FROM debian:stretch-slim

RUN apt-get update \
&& apt-get install -y --no-install-recommends r-base r-base-dev git python3 \
&& apt-get clean

RUN git clone https://github.com/DChandlerP/python-hello.git
