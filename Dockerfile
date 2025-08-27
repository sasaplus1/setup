FROM ubuntu:latest@sha256:7c06e91f61fa88c08cc74f7e1b7c69ae24910d745357e0dfe1d2c0322aaf20f9

RUN apt-get --yes update && \
  apt-get --yes install bash build-essential curl file git

ENV LC_ALL=C

WORKDIR /mnt

CMD ["bash"]
