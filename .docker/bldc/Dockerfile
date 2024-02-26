ARG FROM_TAG="22.04"
FROM ubuntu:${FROM_TAG}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget make bzip2 python3 git build-essential && \
    apt-get clean

ARG ARM_SDK_FILE=gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2 
RUN wget --no-check-certificate -N -P /tmp https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/${ARM_SDK_FILE} && \
    tar -C /opt -xjf /tmp/${ARM_SDK_FILE}  && \
    rm /tmp/${ARM_SDK_FILE}

ENV PATH="/opt/gcc-arm-none-eabi-7-2018-q2-update/bin:${PATH}"