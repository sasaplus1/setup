FROM ubuntu:latest@sha256:a08e551cb33850e4740772b38217fc1796a66da2506d312abe51acda354ff061

RUN apt-get --yes update && \
  apt-get --yes install bash build-essential curl file git

ENV LC_ALL=C

WORKDIR /mnt

CMD ["bash"]
