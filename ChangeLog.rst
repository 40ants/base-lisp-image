===========
 ChangeLog
===========

0.19.0 (2024-06-01)
===================

* Move to SBCL 2.4.6.

0.18.0 (2023-11-06)
===================

* Move to SBCL 2.3.10.
* Removed SBCL built from scratch. Only sbcl-bin is available now.

0.17.0 (2022-06-14)
===================

* Using Fukamachi's base image with roswell and SBCL. And move to SBCL 2.2.5

0.16.0 (2022-06-14)
===================

* Using some trick to minimize image size

0.15.0 (2021-09-19)
===================

* Move Qlot from 0.10.8 to 0.11.5.

  **Pay attention!** 0.10.x and 0.11.x are incompatible and if you've
  generated qlfile.lock using 0.11.x, you'll not be able to do ``qlot install``
  using qlot 0.10.x.

0.14.0 (2021-04-23)
===================

* Removed ``mgl-pax-minimal`` system.
* Added system ``40ants-doc``.
* Upgraded Roswell from ``20.01.14.104`` to ``21.01.14.108``.
* Upgraded Qlot from ``0.10.6`` to ``0.10.8``
* Upgraded ASDF from ``3.3.4.10`` to ``3.3.4.13``.
* Upgraded SBCL from ``2.1.2`` to ``2.1.3``.
* Upgraded CCL from ``1.11.5`` to ``1.12``.

0.13.0 (2021-03-10)
===================

* Upgraded base instance from ``ubuntu:bionic`` to ``ubuntu:focal``,
  because newer ``sbcl-bin`` requires ``libc2 == 2.28``, but Bionic has only ``2.27``
  ``Ubuntu:focal`` has ``libc2 == 2.31``.

* Upgrade SBCL from ``1.5.6`` to ``2.1.2``.
* Upgrade ASDF from ``3.3.3.3`` to ``3.3.4.10``.

0.12.0 (2020-04-28)
===================

* Downgraded Ubuntu version from Disco to Bionic, because Disco is not supported anymore, bu Bionic is LTS release and will be supported til 2023.

0.11.0 (2020-03-11)
===================

* Roswell was upgraded from 19.09.12.102 (8d66d90b1d8c1990ad8a66c49c9e9bf26e56eb41) to 20.01.14.104 (df5127751b684eb2a5cdfe10fe68aab3bfb6d892)
* Qlot was upgraded from 0.10.5 to 0.10.6 (b3ce3ce0f921119aa9ea82d0982095a3975723eb).

0.10.1 (2019-12-09)
===================

* Qlot was upgraded to 0.10.5 version where ``--no-deps`` option is supported (6fdc1ca4778a905870b6c7bbbd598b3966d53453).

0.10.0 (2019-12-09)
===================

* Qlot was upgraded to 0.10.4 version (05fe3aeabefd85988dc93cb216f05c9c1d2f429a).

0.9.1 (2019-10-02)
==================

* Roswell was upgraded from 19.08.10.101 (0d8e06db338878fb953883f23dee86943d4446a5) to 19.09.12.102 (8d66d90b1d8c1990ad8a66c49c9e9bf26e56eb41).
  In this version was fixed the issue with using qlot installed from Quicklisp instead of GitHub.

0.9.0 (2019-09-14)
==================

* Roswell was upgraded: 19.06.10.100 (827d03e870138cd5fe90cf23a6e67484f0432e07) -> 19.08.10.101 (0d8e06db338878fb953883f23dee86943d4446a5)
* Qlot was upgraded: 8a6fb6d2f6d95434b694ff53eff31521d05af23b -> 0.9.15 (340a812036749eb72443e4a572f9cde4b978f853)
* SBCL was upgraded: 1.5.5 -> 1.5.6

0.8.0
=====

* Ubuntu was upgraded from Trusty (2014.04) to Disco (2019.04).

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
