FROM nvidia/cuda:11.3.1-base-ubuntu20.04

ENV PYTHON_VERSION=3.9

# RUN apt-get update && apt-get install -y \
#     build-essential \
#     gcc \
#     git \
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -qq update \
    && apt-get -qq install --no-install-recommends \
    git \
    python${PYTHON_VERSION} \
    python${PYTHON_VERSION}-venv \
    python3-pip \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s -f /usr/bin/python${PYTHON_VERSION} /usr/bin/python3 && \
    ln -s -f /usr/bin/python${PYTHON_VERSION} /usr/bin/python && \
    ln -s -f /usr/bin/pip3 /usr/bin/pip

RUN pip install --upgrade pip

RUN pip install torch==1.12.1+cu113 -f https://download.pytorch.org/whl/torch

RUN pip install git+https://github.com/openai/whisper.git 
