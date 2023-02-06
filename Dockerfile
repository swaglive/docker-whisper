ARG         base=python:3.9.9-alpine

###

FROM        ${base}

ARG         version=20230124
ARG         conda_version=22.11.1-1
ARG         arch=x86_64

ENV         PATH=/root/miniconda3/bin:$PATH

RUN         wget -O Miniconda3.sh https://repo.anaconda.com/miniconda/Miniconda3-py39_${conda_version}-Linux-${arch}.sh && \
            bash Miniconda3.sh -b && \
            conda install --yes -c pytorch -c nvidia \
                pytorch \
                torchvision \
                torchaudio \
                pytorch-cuda=11.7 \
                openai-whisper && \
            apt-get install -y \
                ffmpeg
