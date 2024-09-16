# pytorch-riscv64

[![Coverage](https://shields.io/badge/python-3.8%20%7C%203.9%20%7C%203.10%20%7C%203.11-blue)](https://github.com/KumaTea/pytorch-riscv64/releases)

[PyTorch](https://github.com/pytorch/pytorch)
wheels (whl)
for **`riscv64` / RISC-V 64 bit** devices

## Install

### pip

**`pip install torch --prefer-binary --extra-index-url https://ext.kmtea.eu/simple`**

* preferred index: **https://ext.kmtea.eu/simple**
* targeted index: https://rv.kmtea.eu/simple
* manually pick `whl` files: **[releases](https://github.com/KumaTea/pytorch-riscv64/releases)**

## Build

1. Install Docker Desktop on Windows

  ![Docker Desktop](assets/01_01_docker_desktop.webp)

  You can use Dokcer for Linux, macOS or any other platforms you like.
  And Docker on Windows is likely to have more performance loss.
  Here I use it just because it configures cross compilation environment automatically.

  ![Docker Container](assets/01_02_docker_container.webp)

2. Create Ubuntu 22.04 Image

  While the earliest version of Ubuntu that provided images for RISC-V is 20.04,
  it comes with cmake 3.16 but PyTorch requires 3.18.

  [Dockerfile](src/Dockerfile)

   ```dockerfile
   FROM --platform=linux/riscv64 buildpack-deps:jammy
   ```

3. Install Python

## FAQ

* Q: Which versions of Python will be built?

  A: Following the official PyTorch builds.
