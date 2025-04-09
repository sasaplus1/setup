FROM ubuntu:latest@sha256:1e622c5f073b4f6bfad6632f2616c7f59ef256e96fe78bf6a595d1dc4376ac02

RUN apt-get --yes update && \
  apt-get --yes install bash build-essential curl file git

ENV LC_ALL=C

WORKDIR /mnt

CMD ["bash"]
