Collection of PKGBUILDs for cross-building GTK+2 and GTK+3 applications on
ArchLinux using a mingw-w64 system. Think of it as a spur of AUR.

The repository is available for cloning on
[github](http://github.com/ntd/aur-fedora-mingw). The one hosted on
[entidi](http://dev.entidi.com/p/aur-fedora-mingw/source/tree/master/)
is provided for browsing and hot linking purposes (the URLs will likely
be permanents).

This is how the project is structured:

* `aur-fedora-mingw`, the repository root
  * `aur`, containing the PKGBUILDs the helper scripts
  * `src`, where the source packages will be downloaded
  * `pkg`, where the built packages will be created
  * `docker`, support files needed by docker

How to use
==========

These are common PKGBUILD files so you can build them in the way you like, e.g.
by using [makepkg](https://wiki.archlinux.org/index.php/Makepkg). Some helper
scripts are provided though, just for convenience. They are based on `yaourt`
but you are free to adapt them to other solutions (patches welcome).

If you want you can customise `afm-mingw-w64-makedepends/makepkg.common.conf`
to fit your environment and update `afm-mingw-w64-makedepends/PKGBUILD`
accordingly.

The following commands should build and install both the 32 and 64 bits
toolchains:

```bash
cd path/to/aur-fedora-mingw/aur
rm */*.pkg.tar.xz # Just to be sure to rebuild everything
env - TERM=$TERM PATH=/usr/bin ./build-all i686
env - TERM=$TERM PATH=/usr/bin ./build-all x86_64
```

Alternatively you can leverage [docker](http://www.docker.com) for running
the building inside an isolated container. This will only create the packages
without installing them. Here is how to do it:

```bash
cd path/to/aur-fedora-mingw
docker build -t afm .
docker run -v $(pwd)/src:/home/user/src -v $(pwd)/pkg:/home/user/pkg afm
```

In both case, if everything goes smoothly, at the end you will have `pkg/`
populated with the binary packages.

Helper scripts
==============

* `build-all ARCH [PACKAGE]...`<br>
  The main script for building the whole toolchain. To minimize potential
  problems raised by unattended environment variables, you could call the
  script by providing only a minimal environment, e.g.:

  ```bash
  env - TERM=$TERM PATH=/usr/bin ./build-all i686
  ```

  You can optionally specify on the command line the name of one or more
  packages to skip, e.g. by passing `fedora-mingw-w64-cairo` you will build
  everything but cairo.

  This script **does not** automatically create the package database! If you
  want to, you need to create it by yourself with:

  ```bash
  repo-add PACKAGE-DATABASE */*.pkg.tar.xz
  ```

* `pkg-update ARCH PACKAGE`<br>
  It is intended to be used after `build-all` to upgrade only one package. Just
  call it with the proper package name, e.g.:

  ```bash
  ./pkg-update i686 fedora-mingw-w64-glib2
  ```

  This script automatically updates the package database. Actually the name of
  that database is hardcoded in the sources: fire up an editor for details.
* `inc-pkgrel PKGBUILD [...]`<br>
  Increase the [release number](https://wiki.archlinux.org/index.php/PKGBUILD#pkgrel)
  by one on the `PKGBUILD` files provided as argument.
* `repo-update`<br>
  Used by `pkg-update` to update the package database.

History
=======

I badly needed a MinGW environment for cross-compiling my GTK+ applications on
Windows platforms but the PKGBUILDs found in [AUR](http://aur.archlinux.org/)
at that time were a mess, i.e. the toolchain was not working out of the box and
required a lot of manual work to be put on the road. It was clear nobody
was really using it.

Submitting patches and waiting them to be accepted was feasible but really slow
and time consuming, so I decided to develop my own PKGBUILDs basing the code on
the [Fedora MinGW](http://pkgs.fedoraproject.org/cgit/) environment as it seems
to be the best maintained MinGW toolchain available. As far as I know, also
[OpenSUSE](http://build.opensuse.org/project/show?project=windows:mingw) based
its toolchain on the Fedora one.

I am trying to keep these packages in sync with Fedora and, although not mapped
exactly 1:1, they are quite close.

Features and limits
===================

Here is the list of (potential) packages provided by this project:

* fedora-mingw-w64-zlib
* fedora-mingw-w64-bzip2
* fedora-mingw-w64-termcap
* fedora-mingw-w64-win-iconv
* fedora-mingw-w64-gettext
* fedora-mingw-w64-expat
* fedora-mingw-w64-libxml2
* fedora-mingw-w64-libpng
* fedora-mingw-w64-libjpeg-turbo
* fedora-mingw-w64-libffi
* fedora-mingw-w64-glib2
* fedora-mingw-w64-freetype
* fedora-mingw-w64-fontconfig
* fedora-mingw-w64-pixman
* fedora-mingw-w64-icu
* fedora-mingw-w64-cairo
* fedora-mingw-w64-gdk-pixbuf
* fedora-mingw-w64-atk
* fedora-mingw-w64-harfbuzz
* fedora-mingw-w64-pango
* fedora-mingw-w64-gtk2
* fedora-mingw-w64-gtk3
* fedora-mingw-w64-nsis

Some additional package are not based on the Fedora ones. They are
developed internally and prefixed with afm (*A*UR *F*edora *M*inGW) to
differentiate them from the others:

* afm-mingw-w64-makedepends
* afm-mingw-w64-gobject-introspection
* afm-mingw-w64-lua
* afm-mingw-w64-lua-lgi

The `build-all` helper script can be used as a one-line solution to build all
from scratch. It uses [yaourt](https://wiki.archlinux.org/index.php/Yaourt) for
pulling it the required dependencies either from Archlinux community or from
AUR.

If you intend to build the toolchain in your own way, refer to `build-all` to
know the exact **order of build**, so check it out to see the most up to date
list and order of packages.

To keep the dependecies as low as possible, this toolchain does not contain
some image format I do not use, most notably **SVG** and **tiff**.

External dependencies
=====================

Check the source of `build-all` for knowing the exact dependencies needed. They
are pulled in from core, extra, multilib and community. One dependency
(`mingw-w64-tools`) must be compiled from AUR.

License
=======

The code provided by this project is free software released under the MIT
license. See `COPYING` for details.

This license is **not** extended to the sources of the packages. Every
package fetched by this project is free software but you need to hunt
inside the source tree to know the exact license.
