#!/bin/bash

LOCAL="/build"
PACKAGE="centreon-firewalld"

# Clean all old packages
rm -rf $LOCAL/out/*

cd $LOCAL/$PACKAGE/src
VERSION="$(grep Version $PACKAGE.specs | awk '{print $2}')"
mkdir -vp tmp/$PACKAGE-$VERSION
cp -rv $LOCAL/services/* tmp/$PACKAGE-$VERSION/
cd tmp/ && tar czvpf $PACKAGE-$VERSION.tar.gz $PACKAGE-$VERSION/
mkdir -vp ~/rpmbuild/SOURCES
mv -v $PACKAGE-$VERSION.tar.gz ~/rpmbuild/SOURCES/
cd ../
rm -vrf tmp
rpmbuild -ba $PACKAGE.specs
rm -vrf rpm && mkdir -v rpm
cp -rv ~/rpmbuild/SRPMS rpm/
cp -rv ~/rpmbuild/RPMS rpm/
rm -vrf ~/rpmbuild

cd $LOCAL
find . -type f -path '*/src/*' -name '*x86_64.rpm' -exec cp -v {} out/ \;
