#!/bin/bash

docker rm -f mind_test
docker run \
    --entrypoint /bin/bash \
    --name=mind_test -v `readlink -f ../..`:/workspace \
    -w /workspace \
    xgrzsza/mind_base:0 \
    -c \
"""
./mind/bin/flake8.sh
./mind/bin/pylint.sh
./mind/bin/unittest.sh
echo \"Unittest exited with: \$?\"
"""
export exit_code=$?
echo "Docker exit code: $exit_code"
exit $exit_code