Collection of PKGBUILDs for cross-building GTK+2 and GTK+3 applications on
ArchLinux using a mingw-w64 system. Think of it as a spur of AUR.

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

Bootstrapping GCC
=================

The information reported here is loosely based on the
[Fedora wiki](http://fedoraproject.org/wiki/MinGW/CrossCompilerFramework)

Some compilers and libraries, such as gcc, requires themselves. Put in other
words, to be able to compile gcc you need to break a circular dependency.

An older version of gcc with special parameters is used to generate the first
stripped down version (gcc-bootstrap) and then gcc is rebuilt with it to get
the final version (gcc-nogomp).

Here is the proper order for bootstraping a new version of GCC from scratch:

1. Build and install fedora-mingw-w64-binutils.
2. Build and install fedora-mingw-w64-headers.
3. Build and install fedora-mingw-w64-gcc-bootstrap.
4. Build and install fedora-mingw-w64-crt.
5. Build and install fedora-mingw-w64-gcc-nogomp: this in turn will uninstall
   fedora-mingw-w64-gcc-bootstrap. This is a final GCC package compiled
   without libgomp support because it would require fedora-mingw-w64-pthreads,
   still not buildable at this point.

At this point you should be able to rebuild every MinGW package with the new
compiler. After building and installing fedora-mingw-w64-pthreads you can
also recompile GCC with libgomp support (fedora-mingw-w64-gcc).

Other dependencies
==================

The following dependencies have been compiled directly from AUR:

mingw-w64-pkg-config
