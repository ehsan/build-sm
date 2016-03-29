#!/bin/bash

set -e
set -x

if test -d mozjs; then
  rm -rf mozjs
fi

SM_DIR=$HOME/moz/src

rsync -av --delete $SM_DIR/nsprpub mozjs/
rsync -av --delete $SM_DIR/mfbt mozjs/
rsync -av --delete $SM_DIR/memory mozjs/
rsync -av --delete $SM_DIR/mozglue mozjs/
rsync -av --delete $SM_DIR/python mozjs/
rsync -av --delete $SM_DIR/moz.configure mozjs/
rsync -av --delete $SM_DIR/moz.build mozjs/
rsync -av --delete $SM_DIR/Makefile.in mozjs/
rsync -av --delete $SM_DIR/configure.py mozjs/
rsync -av --delete $SM_DIR/build mozjs/
rsync -av --delete $SM_DIR/testing/mozbase mozjs/testing/
rsync -av --delete $SM_DIR/testing/moz.build mozjs/testing/
rsync -av --delete $SM_DIR/config mozjs/
rsync -av --delete $SM_DIR/intl/icu mozjs/intl/
mkdir -p mozjs/layout/tools/reftest
rsync -av --delete $SM_DIR/layout/tools/reftest/reftest mozjs/layout/tools/reftest/
mkdir -p mozjs/dom/bindings
rsync -av --delete $SM_DIR/dom/bindings/mozwebidlcodegen mozjs/dom/bindings/
mkdir -p mozjs/toolkit/mozapps
rsync -av --delete $SM_DIR/toolkit/mozapps/installer mozjs/toolkit/mozapps/
rsync -av --delete $SM_DIR/js mozjs/

if test -d objdir; then
  rm -rf objdir
fi

mkdir objdir && cd objdir
../mozjs/js/src/configure && make -j8
