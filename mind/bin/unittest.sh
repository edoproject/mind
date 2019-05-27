#!/bin/bash
[[ -f /virtual_env/bin/activate ]] && source /virtual_env/bin/activate
cd mind
coverage run --branch --source /workspace/mind/src -m unittest discover
export exit_code=$?

COVERAGE_THRESHOLD=100
COVERAGE_PERCENT=$( coverage report -m | grep TOTAL | awk '{ print substr($6, 0, length($6)-1) }' )
[[ $COVERAGE_PERCENT -lt $COVERAGE_THRESHOLD ]] && result=fail || result=pass

echo "Total coverage: ${COVERAGE_PERCENT}%"
echo "Total coverage threshold: ${COVERAGE_THRESHOLD}%"
echo "Total coverage result: $result"
echo "Exit code: $exit_code"

coverage html
[[ ${exit_code} -eq 1 || ${result} == "fail" ]] && exit 1 || exit 0
