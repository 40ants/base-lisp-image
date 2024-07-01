FROM fukamachi/sbcl:2.3.10-ubuntu AS lisp-image-with-roswell

# Also, we are installing libev4 make Woo webserver work.

RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt set -x; \
    apt-get update && \
    apt-get install -y \
    locales \
    libev4

# To suppress this style warning
# "Character decoding error..."
RUN locale-gen en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Installing a Qlot 0.11.5
RUN ros install fukamachi/qlot/0.11.5

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
RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt set -x; \
    apt-get update && \
    apt-get install -y bzip2 && \
    ros install sbcl-bin/2.4.6 && \
    apt-get remove -y --auto-remove bzip2


FROM lisp-image-with-roswell AS lisp-image-with-sbcl
RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt set -x; \
    apt-get update && \
    apt-get install -y zlib1g-dev && \
    ros install sbcl/2.4.6 && \
    apt-get remove -y --auto-remove zlib1g-dev
