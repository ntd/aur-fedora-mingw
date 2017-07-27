Collection of PKGBUILDs for cross-building GTK+2 and GTK+3 applications on
ArchLinux using a mingw-w64 system. Think of it as a spur of AUR.

The repository is available for cloning on
[github](http://github.com/ntd/aur-fedora-mingw). The one hosted on
[entidi](http://dev.entidi.com/p/aur-fedora-mingw/source/tree/master/)
is provided for browsing and hot linking purposes (the URLs will likely
be permanents).

How to use
==========

These are common PKGBUILD files so you can build them in the usual way, e.g.
by using [makepkg](https://wiki.archlinux.org/index.php/Makepkg). Some helper
scripts are provided, just for convenience:

* `build-all`<br>
  The main script for building the whole toolchain. To minimize the potential
  problems that can be raised by unattended environment variables, you could
  call the script by providing only a minimal environment, e.g.:

    ```
    env -i TERM=xterm-256color PATH=/usr/bin ./build-all
    ```

  You can optionally specify on the command line the name of one or more
  packages to skip, e.g. by passing `fedora-mingw-w64-cairo` you will build
  everything but cairo.

  This script **does not** automatically create the package database! If you
  want, you need to create it by yourself with:

    ```
    repo-add /home/nicola/workdir/aur-fedora-mingw/pkg/entidi */*.pkg.tar.xz
    ```

* `pkg-update`<br>
  It is intended to be used after `build-all` to upgrade only one package. Just
  call it with the proper package name:

    ```
    ./pkg-update fedora-mingw-w64-glib2
    ```

  This script automatically updates the package database. Actually all that
  stuff is hardcoded in the sources: fire up an editor for further info.
* `inc-pkgrel`<br>
  Increase the [release number](https://wiki.archlinux.org/index.php/PKGBUILD#pkgrel)
  by one on the `PKGBUILD` files provided as argument, e.g. the following
  command will increase the release of every package:

    ```
    ./inc-pkgrel */PKGBUILD
    ```
* repo-update
  Used by `pkg-update` to update the package database.


Motivation
==========

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

The following dependencies need to be pulled in directly from the Archlinux
community repository:

* mingw-w64-gcc
* wine

The following dependencies need to be compiled from AUR:

* mingw-w64-tools (required for building cairo)

License
=======

The code provided by this project is free software released under the MIT
license. See `COPYING` for details.

This license is **not** extended to the sources of the packages. Every
package fetched by this project is free software but you need to hunt
inside the source tree to know the exact license.
