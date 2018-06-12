===========
 ChangeLog
===========

0.3.0
=====

Starting from this version, tags were renamed: ccl -> ccl-bin, sbcl ->
sbcl-bin. And also, usual ``sbcl`` version now corresponds to a SBCL
built from sources with support of zlib compression and building
compressed binaries.

Also, these version updates were made:

* Upgrade roswell from 18.4.10.90 to 18.4.10.91.
  This version fixes the issue when ros build tries to download
  https://github.com/roswell/asdf/archive/NIL.tar.gz archive.
* Upgrade ASDF from 3.3.1.1 to 3.3.2.2.
* Upgrade SBCL from 1.4.6 to 1.4.8.

0.2.1
=====

Script ``install-dependencies`` was fixed. Now it uses additional
``install-dependencies.ros`` to do the right job.

0.2.0
=====

* Now WORKDIR is /app.
* Added script ``install-dependencies``, which runs ``qlot install`` and
  ``qlot exec ros --eval '(ql:quickload "app-deps")'``.

0.1.0
=====

* Initial version.
