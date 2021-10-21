#!/bin/bash
set -eu

if [[ $(ls -la | grep -e "code-server.sif" | wc -l) == 0 ]]; then
    echo "Build the image for the first time only."
    sudo singularity build code-server.sif code-server.def 
fi

if [[ $(singularity instance list | grep -e "code-server" | wc -l) == 0 ]]; then
    singularity instance start --writable-tmpfs code-server.sif code-server
else
    echo "Instance has already been started."
fi
