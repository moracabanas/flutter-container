FROM cirrusci/flutter:3.0.5

RUN apt update && apt install -y \
  fonts-liberation \
  libgbm1 \
  xdg-utils

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  dpkg -i google-chrome-stable_current_amd64.deb && \
  rm google-chrome-stable_current_amd64.deb

RUN apt install -y \
  pkg-config \
  clang \
  cmake \
  ninja-build \
  libgtk-3-dev 

RUN wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.2.1.16/android-studio-2021.2.1.16-linux.tar.gz && \
  tar -xvf android-studio-2021.2.1.16-linux.tar.gz && \
  rm android-studio-2021.2.1.16-linux.tar.gz && \
  mv android-studio /opt/android-studio && \
  chown -R 1000:1000 /opt/android-studio && \
  chmod -R 775 /opt/android-studio

RUN chown -R 1000:1000 /sdks/flutter && \
  chmod -R 775 /sdks/flutter && \
  rm -r /sdks/flutter/bin/cache

ARG USERNAME=flutter
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  #
  # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
  && apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
RUN echo "alias studio=/opt/android-studio/bin/studio.sh" >> ~/.bashrc

WORKDIR /build

RUN flutter doctor && \
  flutter precache

