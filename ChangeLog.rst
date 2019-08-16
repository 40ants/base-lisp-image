===========
 ChangeLog
===========

0.7.0
=====

* Roswell was upgraded: 18.10.10.95 -> 19.06.10.100 (827d03e870138cd5fe90cf23a6e67484f0432e07)
* Qlot was upgraded: b4b408b890347d94a4c31f8d5c3359472ae2931a -> 8a6fb6d2f6d95434b694ff53eff31521d05af23b
* ASDF was upgraded: 3.3.2.10 -> 3.3.3.3
* SBCL was upgraded: 1.4.11 -> 1.5.5
* Locale was changed from ru_RU.UTF-8 to en_US.UTF-8

0.6.1
=====

Now default command is ``ros run``.

0.6.0
=====

* Roswell was upgraded: 18.8.10.93 -> 18.10.10.95
* Qlot was upgraded to b4b408b890347d94a4c31f8d5c3359472ae2931a where
``CL_SOURCE_REGISTRY`` variable is respected and extended.
* ASDF was upgraded: 18.10.10.95 -> 3.3.2.10
* SBCL was upgraded: 1.4.11

0.5.0
=====

Roswell was upgraded: 18.6.10.92 -> 18.8.10.93
Qlot was updated to 5233f4d3bed81251e5357ab9f9e2ba5ab7af80f9 where
custom quicklisp's distributions are supported.
SBCL was upgraded: 1.4.9 -> 1.4.11

0.4.0-exp-1
=====

Roswell was upgraded: 18.4.10.91 -> 18.6.10.92.
Qlot updated to the latest b783d5945cb34df72669979c96216f4837d8517a
commit.
SBCL was upgraded: 1.4.8 -> 1.4.9

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
