#!/bin/sh

set -e

# Defaults are 6000 logs per minute, by average of the last 5 minutes
rate=${RATE:-6000}
window=${WINDOW:-5}
interval=${INTERVAL:-60s}
dir="${DIR:-"/fluent-bit/etc"}"
filename="${FILENAME:-"fluent-bit-filters.conf"}"
match_prefix="${MATCH_PREFIX:-"kube-container-by-ns"}"


function add_namespace {
cat  << EOF >> "${dir}/${filename}"
[FILTER]
    Name     throttle
    Alias    ${ns}
    Match    ${match_prefix}.${ns}.*
    Rate     ${rate}
    Window   ${window}
    Interval ${interval}

EOF
}

# Create dir and clear file
mkdir -p "${dir}"
> "${dir}/${filename}"

# Get namespaces
namespaces=$(kubectl get ns --no-headers | awk '{print $1}')

# Create filters
for ns in $namespaces
do
   add_namespace
done
