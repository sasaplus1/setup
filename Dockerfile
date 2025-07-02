FROM ubuntu:latest@sha256:440dcf6a5640b2ae5c77724e68787a906afb8ddee98bf86db94eea8528c2c076

RUN apt-get --yes update && \
  apt-get --yes install bash build-essential curl file git

ENV LC_ALL=C

WORKDIR /mnt

CMD ["bash"]
