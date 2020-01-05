FROM ubuntu:latest

RUN apt update --yes && apt install --yes bash build-essential curl file git

WORKDIR /mnt

CMD ["bash"]
