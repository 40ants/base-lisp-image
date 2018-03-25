=================
 Base Lisp Image
=================

This is a base lisp image for 40Ants projects.

It includes Qlot, Roswell, ASDF (3.3.1.1) and following Lisps:

* SBCL: 1.4.5
* Clozure CL: 1.11.5. 


How to use
==========

Build image::

  docker build -t base-lisp-image .

Start container for development::

  docker run --rm --name dev-lisp -ti -p 4005:4005 -v `pwd`:/app base-lisp-image

