# https://hub.docker.com/r/nvidia/cuda から必要なイメージを選択
FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Tokyo
ENV MUJOCO_GL=egl

RUN apt update && apt upgrade -y \
 && apt install -y --no-install-recommends \
        python3-pip \
        #build-essential \
        #gnupg2 \
        #make \
        #cmake \
        #ffmpeg \
        #swig \
        #unzip \
        #zlib1g-dev \
        #libz-dev \
        #libglfw3 \
        libglfw3-dev \
        #libxrandr2 \
        #libxinerama-dev \
        #libxi6 \
        #libxcursor-dev \
        #libgl1-mesa-dev \
        #libglew-dev \
        #libosmesa6-dev \
        libgl1-mesa-glx \
        #libosmesa6 \
        #lsb-release \
        #ack-grep \
        #patchelf \
        git \
        git-lfs \
        wget \
        curl \
        # sudo \
        #xvfb \
        vim
        #xpra \
        #xserver-xorg-dev \
        #python-opengl \
        #ffmpeg > /dev/null 2>&1 \
        #imagemagick

RUN pip install -U pip \
 && pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116

RUN pip install \
  jupyterlab \
  ipywidgets \
  sklearn \
  numpy \
  matplotlib \
  pandas \
  gym \
  #pyvirtualdisplay \
  #piglet \
  imageio==2.4.1 \
  #PILLOW \
  dm_control>=1.0.0 \
  tensorflow \
  tensorboardX \
  moviepy \
  seaborn

# ユーザーを作成
#ARG DOCKER_UID=1000
#ARG DOCKER_USER=docker
#ARG DOCKER_PASSWORD=docker
#RUN useradd -m \
  #--uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
  #&& echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

#USER ${DOCKER_USER}

COPY docker-entrypoint.sh /tmp

WORKDIR /home

ENTRYPOINT ["bash", "/tmp/docker-entrypoint.sh"]

CMD [ "/bin/bash" ]
