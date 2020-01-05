FROM ubuntu:latest

RUN apt update --yes && apt install --yes bash build-essential curl file git

ENV LC_ALL=C

WORKDIR /mnt

CMD ["bash"]
