=================
 Base Lisp Image
=================

This is a base lisp image for 40Ants projects.

It includes `Qlot`_, `Roswell`_, ASDF (3.3.1.1) and following Lisps:

* SBCL: 1.4.5
* Clozure CL: 1.11.5.

Image is based on LTS Ubuntu Trusty (16.04).


How to use
==========

Pull image::

  docker pull 40ants/base-lisp-image

Start container for development::

  docker run \
         --rm -ti \
         --name dev-lisp \
         -p 4005:4005 \
         -v `pwd`:/app \
         40ants/base-lisp-image

And of cause you can use it as a base image in your own dockerfiles.

How to build a new image
========================

.. code::
   
  docker build -t 40ants/base-lisp-image .
  docker push 40ants/base-lisp-image


Ideas
=====

* Embed `SLY`_ to make it available out of the box.
* Start versioning the image.

.. _SLY: http://joaotavora.github.io/sly/#A-SLY-tour-for-SLIME-users
.. _Roswell: https://github.com/roswell/roswell
.. _Qlot: https://github.com/fukamachi/qlot
