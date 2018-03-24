FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y \
    sbcl \
    git \
    build-essential \
    automake \
    libcurl4-openssl-dev
RUN git clone -b release https://github.com/roswell/roswell.git /roswell
RUN cd /roswell && ./bootstrap && ./configure && make install
ENV PATH=~/.roswell/bin/:$PATH

# ставим нужную версию sbcl
RUN ros install sbcl-bin/1.4.5
RUN ros install ccl-bin/1.11.5

# ставим свеженький Qlot
RUN ros install fukamachi/qlot

# Зафиксируем версию ASDF, чтобы во всех имплементациях она была одинакова
# и правильно работал package inferred system
RUN ros install asdf/3.3.1.1

# Для работы Woo
RUN apt-get -y install libev4

# чтобы лисп не выдавал style warning
# "Character decoding error..."
RUN locale-gen ru_RU.UTF-8
ENV LC_ALL=ru_RU.UTF-8

