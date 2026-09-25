#!/bin/sh

set -e

echo "======================================"
echo "       NGINX HELM TEST STARTED"
echo "======================================"

echo "Testing NGINX service:"
echo "  Host : ${NGINX_SERVICE}"
echo "  Port : ${NGINX_PORT}"

URL="http://${NGINX_SERVICE}:${NGINX_PORT}"

echo
echo "Checking HTTP connectivity to ${URL} ..."

HTTP_STATUS=$(wget -S -O /dev/null "${URL}" 2>&1 \
  | awk '/HTTP\// {print $2}' \
  | tail -1)

echo "HTTP status: ${HTTP_STATUS}"

if [ "${HTTP_STATUS}" != "200" ]; then
  echo "ERROR: NGINX test FAILED"
  exit 1
fi

echo
echo "NGINX HTTP test PASSED"

echo "======================================"
echo "       NGINX HELM TEST PASSED"
echo "======================================"
