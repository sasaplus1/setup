FROM ubuntu:latest@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782

RUN apt-get --yes update && \
  apt-get --yes install bash build-essential curl file git

ENV LC_ALL=C

WORKDIR /mnt

CMD ["bash"]
