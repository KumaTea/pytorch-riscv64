#!/usr/bin/env bash

set -xe

VER="$1"
export BUILD_VERSION="$VER"


git clone https://github.com/pytorch/vision || :

cd vision
git checkout "v$VER"
git checkout --recurse-submodules "v$VER"
git submodule sync
git submodule update --init --recursive


# export MAX_JOBS=1
export BUILD_TEST=0


python3 setup.py build
python3 setup.py install
python3 setup.py bdist_wheel
