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

RUN echo "alias studio=/opt/android-studio/bin/studio.sh" >> /root/.bashrc

WORKDIR /build

RUN flutter precache

