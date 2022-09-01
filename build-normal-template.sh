#!/bin/bash

set -e

if  [[ "$OSTYPE" == "linux-gnu"* ]]; then
    scons platform=x11 target=release tools=no use_lto=yes module_gtlf=yes -j8
elif [[ "$OSTYPE" == "darwin"* ]]; then
    scons platform=osx arch=arm64 target=release tools=no module_gltf=yes -j8
    scons platform=osx arch=x86_64 target=release tools=no module_gltf=yes -j8
    lipo -create bin/godot.osx.opt.arm64 bin/godot.osx.opt.x86_64 -output bin/godot.osx.opt.universal
else
    scons platform=windows target=release tools=no use_lto=yes module_gltf=yes -j8
fi

