=================
 Base Lisp Image
=================

This is a base lisp image for 40Ants projects.

Latest version of this image is **0.10.1**.
It includes `Qlot`_ (0.10.4), `Roswell`_ (19.09.12.102), ASDF (3.3.3.3) and following Lisps:

* SBCL: 1.5.6
* Clozure CL: 1.11.5

Image is based on Ubuntu Disco (19.04).

It is hosted on the Docker Hub. Choose appropriate version in the
`ChangeLog`_ and download it from `DockerHub's releases`_ page.


How to use
==========

Quick start
-----------

Start container for development::

  docker run \
         --rm -ti \
         --name dev-lisp \
         -p 4005:4005 \
         -v `pwd`:/app \
         40ants/base-lisp-image:latest-sbcl-bin

And of cause you can use it as a base image in your own dockerfiles.


Inherit your own image from base-lisp-image
-------------------------------------------

Here is a minimal example:

.. code:: bash

   FROM 40ants/base-lisp-image:latest-sbcl-bin

   COPY qlfile qlfile.lock app-deps.asd /app/
   RUN install-dependencies

   COPY . /app

   EXPOSE 80
   CMD /app/entrypoint.sh


This way you can use this image for deployment of your application.


How to build a new image
========================

.. code::
   
   ./build.sh


Ideas
=====

* Embed `SLY`_ to make it available out of the box.

.. _SLY: http://joaotavora.github.io/sly/#A-SLY-tour-for-SLIME-users
.. _Roswell: https://github.com/roswell/roswell
.. _Qlot: https://github.com/fukamachi/qlot
.. _DockerHub's releases: https://hub.docker.com/r/40ants/base-lisp-image/tags/
.. _ChangeLog: ChangeLog.rst
