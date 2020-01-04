FROM ubuntu:latest

RUN apt update --yes && apt install --yes bash build-essential

WORKDIR /root

RUN make setup

CMD ["bash"]
