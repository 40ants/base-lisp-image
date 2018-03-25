=================
 Base Lisp Image
=================

This is a base lisp image for 40Ants projects.

It includes Qlot, Roswell, ASDF (3.3.1.1) and following Lisps:

* SBCL: 1.4.5
* Clozure CL: 1.11.5.

Image is based on LTS Ubuntu Trusty (16.04).


How to use
==========

Pull image::

  docker pull 40ants/base-lisp-image

Start container for development::

  docker run --rm --name dev-lisp -ti -p 4005:4005 -v `pwd`:/app base-lisp-image

And of cause you can use it as a base image in your own dockerfiles.

How to build a new image
========================

.. code::
   
  docker build -t 40ants/base-lisp-image .
  docker push 40ants/base-lisp-image

