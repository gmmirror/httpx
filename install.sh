#!/usr/bin/env bash

if [[ ! -d "${PREFIX}/opt" ]]; then
    command mkdir -p "${PREFIX}/opt"
fi

if [[ -d "${PREFIX}/opt/httpx" ]]; then
    command rm -rf "${PREFIX}/opt/httpx"
fi

if [[ -x "${PREFIX}/bin/httpx" ]]; then
    command rm -f "${PREFIX}/bin/httpx"
fi

command git clone --depth 1 \
    'https://github.com/projectdiscovery/httpx' \
    "${PREFIX}/opt/httpx"

cd "${PREFIX}/opt/httpx"
command go mod tidy
command go build -v -o \
    "${PREFIX}/bin/httpx" \
    "cmd/httpx/main.go"
cd