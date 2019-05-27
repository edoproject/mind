#!/bin/bash
source /virtual_env/bin/activate
cd mind
find . -iname "*.py" -path "./*" | \
    tee python_files | \
        xargs python3 -m flake8 \
            --max-line-length=100
export exit_code=$?
exit $exit_code