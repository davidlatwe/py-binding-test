#!/usr/bin/env bash

NANOBIND=0
CLEAN=0
BUILD_TYPE="Release"

NANOBIND=${1:-$NANOBIND}
CLEAN=${2:-$CLEAN}

scriptroot=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Detect platform
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     platform=linux;;
    Darwin*)    platform=macos;;
    *)          platform="UNKNOWN:${unameOut}"
esac


build_dir=build/$platform

if [ "$CLEAN" -ne 0 ]; then
    echo "-- Cleaning.."
    rm -rf "$build_dir"
fi

mkdir -p "$build_dir"
cd "$build_dir" || exit

cmake ../.. -DCMAKE_BUILD_TYPE="$BUILD_TYPE" \
            -DUSE_NANOBIND="$NANOBIND" \
            -DPython_EXECUTABLE=$(which python3)

cmake --build . --config "$BUILD_TYPE"
success=$?

exit $success
