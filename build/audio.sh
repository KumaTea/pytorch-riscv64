#!/usr/bin/env bash

set -xe

VER="$1"
export BUILD_VERSION="$VER"


git clone https://github.com/pytorch/audio || :

cd audio
git checkout "v$VER"
git checkout --recurse-submodules "v$VER"
git submodule sync
git submodule update --init --recursive


# export MAX_JOBS=1
export BUILD_TEST=0
export BUILD_SOX=1

PY_VER=$(python3 -c "print('.'.join(map(str, __import__('sys').version_info[:2])))")
ARCH=$(uname -m)

wget https://github.com/gcc-mirror/gcc/raw/master/config.guess
cp config.guess "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/mad/" || mkdir -p "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/mad" && cp config.guess "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/mad/"
cp config.guess "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/amr/" || mkdir -p "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/amr" && cp config.guess "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/amr/"
cp config.guess "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/lame/" || mkdir -p "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/lame" && cp config.guess "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/lame/"
cp config.guess "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/ogg/" || mkdir -p "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/ogg" && cp config.guess "build/temp.linux-$ARCH-$PY_VER/third_party/sox/src/ogg/"
rm config.guess

python3 setup.py build
python3 setup.py install
python3 setup.py bdist_wheel
