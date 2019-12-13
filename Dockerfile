FROM ubuntu:disco AS lisp-image-with-roswell

RUN apt-get update && apt-get install -y \
    language-pack-en \
    git \
    build-essential \
    automake \
    libcurl4-openssl-dev

# The latest version could be found here:
# https://github.com/roswell/roswell
RUN git clone https://github.com/roswell/roswell.git /roswell && \
    cd /roswell && \
    git checkout 8d66d90b1d8c1990ad8a66c49c9e9bf26e56eb41


RUN cd /roswell && ./bootstrap && ./configure && make install
ENV PATH=/root/.roswell/bin:$PATH

# Installing a fresh Qlot
RUN ros install 40ants/qlot/freeze/340a812036749eb72443e4a572f9cde4b978f853

# Fixing the ASDF, to make package inferred system work
# on all implementations
#
# The latest version could be found here:
# https://gitlab.common-lisp.net/asdf/asdf
RUN ros install asdf/3.3.3.3

# This utility can report a Lisp version and other
# information, useful for bugreports
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
RUN ros install ccl-bin/1.11.5


# The latest version:
# http://www.sbcl.org
FROM lisp-image-with-roswell AS lisp-image-with-sbcl-bin
RUN ros install sbcl-bin/1.5.6


FROM lisp-image-with-roswell AS lisp-image-with-sbcl
RUN apt-get install -y zlib1g-dev && \
    ros install sbcl/1.5.6 && \
    apt-get remove -y zlib1g-dev && \
    apt-get auto-remove -y
