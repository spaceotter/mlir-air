#!/usr/bin/env bash

##===- utils/clone-mlir-aie.sh - Clone MLIR-AIE --------------*- Script -*-===##
#
# Copyright (C) 2022, Advanced Micro Devices, Inc.
# SPDX-License-Identifier: MIT

##===----------------------------------------------------------------------===##
#
# This script checks out MLIR-AIE.  We use this instead of a git submodule to 
# manage commithash synchronization with LLVM.
#
# This script is called from the github workflows.
#
##===----------------------------------------------------------------------===##

export HASH=5631ba5c19c116bb035c22da69d661ae9ba5a3f4

git clone --depth 1 https://github.com/Xilinx/mlir-aie.git mlir-aie
pushd mlir-aie
git fetch --depth=1 origin $HASH
git checkout $HASH
git submodule update --init
popd
