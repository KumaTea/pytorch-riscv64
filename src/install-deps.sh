#!/usr/bin/env bash

python3 -m pip config set global.extra-index-url https://ext.kmtea.eu/simple

python3 -m pip install -U pip setuptools wheel auditwheel
python3 -m pip install -U cffi dataclasses future oldest-supported-numpy pillow pyyaml requests six typing_extensions tqdm
