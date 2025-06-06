FROM ubuntu:latest@sha256:b59d21599a2b151e23eea5f6602f4af4d7d31c4e236d22bf0b62b86d2e386b8f

RUN apt-get --yes update && \
  apt-get --yes install bash build-essential curl file git

ENV LC_ALL=C

WORKDIR /mnt

CMD ["bash"]
