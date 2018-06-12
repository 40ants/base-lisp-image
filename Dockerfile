FROM ubuntu:trusty AS lisp-image-with-roswell

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    automake \
    libcurl4-openssl-dev
RUN git clone https://github.com/roswell/roswell.git /roswell && \
    cd /roswell && \
    git checkout tags/v18.4.10.91
RUN cd /roswell && ./bootstrap && ./configure && make install
ENV PATH=/root/.roswell/bin:$PATH

# ставим свеженький Qlot
RUN ros install fukamachi/qlot

# Зафиксируем версию ASDF, чтобы во всех имплементациях она была одинакова
# и правильно работал package inferred system
RUN ros install asdf/3.3.2.2

# Утилитка которая репортит версию Лиспа, и другую полезную для багрепортов инфу
RUN ros install 40ants/cl-info

# Для работы Woo
RUN apt-get -y install libev4

# чтобы лисп не выдавал style warning
# "Character decoding error..."
RUN locale-gen ru_RU.UTF-8
ENV LC_ALL=ru_RU.UTF-8

WORKDIR /app

COPY install-dependencies install-dependencies.ros /usr/local/bin/


FROM lisp-image-with-roswell AS lisp-image-with-ccl-bin
RUN ros install ccl-bin/1.11.5


FROM lisp-image-with-roswell AS lisp-image-with-sbcl-bin
RUN ros install sbcl-bin/1.4.8


FROM lisp-image-with-roswell AS lisp-image-with-sbcl
RUN ros install sbcl/1.4.8
