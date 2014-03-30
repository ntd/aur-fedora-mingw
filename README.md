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
win32 and win64, but the PKGBUILDs provided by [AUR](http://aur.archlinux.org/)
were a mess, that is the toolchain was not working out of the box and required
a lot of work to be put on the road (it is clear nobody was using it).
Submitting patches and waiting they were accepted is too slow and time
consuming, so I decided to develop my own PKGBUILDs basing the code on the
[Fedora MinGW](http://pkgs.fedoraproject.org/cgit/) environment, as it seems
the best maintained toolchain available. As far as I know, the cross-compiler
by [OpenSUSE](http://build.opensuse.org/project/show?project=windows:mingw) is
also based on the Fedora one.

I am trying to keep these packages  in sync with Fedora and, although not
mapped exactly 1:1 (I dropped some feature I do not use) they are quite close.

Other dependencies
==================

The following dependencies have been compiled directly from Archlinux
or pulled in from AUR:

* mingw-w64-headers
* mingw-w64-binutils
* mingw-w64-crt
* mingw-w64-winpthreads
* mingw-w64-gcc
* mingw-w64-pkg-config
* mingw-w64-tools (required for building cairo)
