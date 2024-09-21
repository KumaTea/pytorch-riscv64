#!/usr/bin/env bash

VER="2.4.1"
PYTHON_EXE="python3.12"

set -xe

mkdir -p /opt/torch
cd /opt/torch

wget https://github.com/pytorch/pytorch/releases/download/v$VER/pytorch-v$VER.tar.gz
tar -xzf pytorch-v$VER.tar.gz
mv pytorch-v$VER torch
rm pytorch-v$VER.tar.gz
cd torch

export PYTORCH_BUILD_VERSION="$VER"
export PYTORCH_BUILD_NUMBER="1"

rm build/CMakeCache.txt || :

$PYTHON_EXE setup.py build

# export MAX_JOBS=1
# export BUILD_TEST=0
# export USE_BREAKPAD=0

python3 setup.py build
python3 setup.py develop
# python3 setup.py install
python3 setup.py bdist_wheel
