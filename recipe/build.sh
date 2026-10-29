#!/bin/bash
set -exo pipefail

cmake ${CMAKE_ARGS} -G Ninja -S . -B build \
  -DBUILD_SHARED_LIBS=ON

cmake --build build --parallel ${CPU_COUNT}
cmake --install build
