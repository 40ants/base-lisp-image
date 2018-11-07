FROM ubuntu:trusty AS lisp-image-with-roswell

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    automake \
    libcurl4-openssl-dev
# Какая версия последняя, можно посмотреть тут:
# https://github.com/roswell/roswell
RUN git clone https://github.com/roswell/roswell.git /roswell && \
    cd /roswell && \
    git checkout tags/v18.10.10.95
RUN cd /roswell && ./bootstrap && ./configure && make install
ENV PATH=/root/.roswell/bin:$PATH

# ставим свеженький Qlot
RUN ros install 40ants/qlot/freeze/b4b408b890347d94a4c31f8d5c3359472ae2931a

# Зафиксируем версию ASDF, чтобы во всех имплементациях она была одинакова
# и правильно работал package inferred system
#
# Какая версия последняя, можно посмотреть тут:
# https://gitlab.common-lisp.net/asdf/asdf
RUN ros install asdf/3.3.2.10

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

CMD ros run

# Последняя версия:
# https://ccl.clozure.com/download.html
FROM lisp-image-with-roswell AS lisp-image-with-ccl-bin
RUN ros install ccl-bin/1.11.5


FROM lisp-image-with-roswell AS lisp-image-with-sbcl-bin
RUN ros install sbcl-bin/1.4.11


FROM lisp-image-with-roswell AS lisp-image-with-sbcl
RUN ros install sbcl/1.4.11
