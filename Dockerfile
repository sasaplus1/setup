FROM ubuntu:latest

RUN apt update --yes && apt install --yes bash build-essential curl

WORKDIR /mnt

CMD ["bash"]
