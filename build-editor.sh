#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    scons platform=x11 target=release_debug tools=yes -j8
elif [[ "$OSTYPE" == "darwin"* ]]; then
    scons platform=osx arch=arm64 target=release_debug tools=yes -j8
    scons platform=osx arch=x86_64 target=release_debug tools=yes -j8
    lipo -create bin/godot.osx.opt.tools.arm64 bin/godot.osx.opt.tools.x86_64 -output bin/godot.osx.opt.tools.universal
else
    scons platform=windows target=release_debug tools=yes -j8
fi

