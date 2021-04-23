FROM ubuntu:focal AS lisp-image-with-roswell

RUN apt-get update && apt-get install -y \
    language-pack-en \
    git \
    build-essential \
    automake \
    libcurl4-openssl-dev

# The latest version could be found here:
# https://github.com/roswell/roswell
# This hash corresponds to 21.01.14.108 release
RUN git clone https://github.com/roswell/roswell.git /roswell && \
    cd /roswell && \
    git checkout 0b7504f39a19a4a9c7487141b12ecb5f7ae41380


RUN cd /roswell && ./bootstrap && ./configure && make install
ENV PATH=/root/.roswell/bin:$PATH

# Installing a Qlot 0.10.8
RUN ros install 40ants/qlot/freeze/46dd24842928cc423c17eacd49bf026ae6887d9d

# Fixing the ASDF, to make package inferred system work
# on all implementations
#
# The latest version could be found here:
# https://gitlab.common-lisp.net/asdf/asdf
RUN ros install asdf/3.3.4.13

# This utility can report a Lisp version and other
# information, useful for bugreports
RUN ros install 40ants/doc
RUN ros install 40ants/cl-info

# To make Woo webserver work
RUN apt-get -y install libev4

# To suppress this style warning
# "Character decoding error..."
RUN apt-get -y install locales && locale-gen en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

WORKDIR /app

COPY install-dependencies install-dependencies.ros /usr/local/bin/

CMD ros run


# The latest version:
# https://ccl.clozure.com/download.html
FROM lisp-image-with-roswell AS lisp-image-with-ccl-bin
RUN ros install ccl-bin/1.12


# The latest version:
# http://www.sbcl.org
FROM lisp-image-with-roswell AS lisp-image-with-sbcl-bin
RUN ros install sbcl-bin/2.1.3


FROM lisp-image-with-roswell AS lisp-image-with-sbcl
RUN apt-get install -y zlib1g-dev && \
    ros install sbcl/2.1.3 && \
    apt-get remove -y zlib1g-dev && \
    apt-get auto-remove -y
