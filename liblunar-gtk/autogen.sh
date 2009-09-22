#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="liblunar-gtk"

(test -f $srcdir/configure.ac \
  && test -f $srcdir/INSTALL\
  && test -d $srcdir/lunar-gtk) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level $PKG_NAME directory"
    exit 1
}

which gnome-autogen.sh || {
    echo "You need to install gnome-common from the GNOME CVS"
    exit 1
}

ACLOCAL_FLAGS="$ACLOCAL_FLAGS -I m4" REQUIRED_AUTOMAKE_VERSION=1.8 REQUIRED_MACROS=python.m4 USE_GNOME2_MACROS=1 USE_COMMON_DOC_BUILD=yes . gnome-autogen.sh $@