Collection of PKGBUILDs for cross-building GTK+2 and GTK+3 applications on
ArchLinux using a mingw-w64 system. Think of it as a spur of AUR.

The repository is available for cloning on
[github](http://github.com/ntd/aur-fedora-mingw). The one hosted on
[entidi](http://dev.entidi.com/p/aur-fedora-mingw/source/tree/master/)
is provided for browsing and hot linking purposes (the URLs will likely
be permanents).

Motivation
==========

I badly needed a MinGW environment for cross-compiling my GTK+ applications for
for win32 platforms but the PKGBUILDs found in [AUR](http://aur.archlinux.org/)
at that time were a mess, i.e. the toolchain was not working out of the box and
required a lot of manual work to be put on the road. It has been clear nobody
was really using it.

Submitting patches and waiting them to be accepted was feasible but really slow
and time consuming, so I decided to develop my own PKGBUILDs basing the code on
the [Fedora MinGW](http://pkgs.fedoraproject.org/cgit/) environment as it seems
to be the best maintained win32 / win64 toolchain available. As far as I know,
[OpenSUSE](http://build.opensuse.org/project/show?project=windows:mingw) also
based its toolchain on the Fedora one.

I am trying to keep these packages in sync with Fedora and, although not mapped
exactly 1:1, they are quite close.

Features
========

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
* fedora-mingw-w64-nsis)

The `build-all` helper script can be used as a one-line solution to build all
from scratch. It uses [yaourt](https://wiki.archlinux.org/index.php/Yaourt) for
pulling it the required dependencies either from Archlinux community or from
AUR.

If you intend to build the toolchain in your own way, refer to `build-all` to
know the exact **order of build**, so check it out to see the most up to date
list and order of packages.

External dependencies
=====================

The following dependencies need to be pulled in directly from the Archlinux
community repository:

* mingw-w64-headers
* mingw-w64-binutils
* mingw-w64-crt
* mingw-w64-winpthreads
* mingw-w64-gcc

The following dependencies need to be compiled from AUR:

* mingw-w64-pkg-config
* mingw-w64-tools (required for building cairo)

License
=======

The code provided by this project is free software released under the MIT
license. See `COPYING` for details.

This license is **not** extended to the sources of the packages. Every
package fetched by this project is free software but you need to hunt
inside the source tree to know the exact license.
