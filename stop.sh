#!/bin/bash
set -eu

if [[ $(singularity instance list | grep -e "code-server" | wc -l) == 1 ]]; then
    singularity instance stop code-server
else
    echo "No instance exists."
fi