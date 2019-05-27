#!/bin/bash
source /virtual_env/bin/activate
cd mind
find . -iname "*.py" -path "./*" | \
    tee python_files | \
        xargs python3 -m pylint \
            --variable-rgx="[a-z_][a-z0-9_]{0,30}\$" \
            --min-similarity-lines=30 \
            --min-public-methods=1 \
            --max-attributes=10 \
            --max-locals=10 \
            --max-args=10 \
            --max-branches=10 \
            --max-line-length=100
export exit_code=$?
exit $exit_code