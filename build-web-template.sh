#!/bin/bash

set -e

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "not yet implemented"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "not yet implemented"
else
    # Note that this is hardcoded for my path
    source ~/scoop/apps/emscripten/current/emsdk_env.sh
    scons platform=javascript target=release tools=no -j8
fi

