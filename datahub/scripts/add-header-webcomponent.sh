#!/bin/sh

# To be properly executed by datahub initialization need the +x flag 
# so you need to add it with chmod and commit/push it

# Parse default.properties file
file="../../default.properties"
function prop {
    grep "^${1}" ${file} | cut -d'=' -f2
}

DATAHUB_DIR=${1:-/usr/share/nginx/html/datahub}
SNIPPET="<script src=\"$(prop 'headerScript')\"></script><geor-header active-app='datahub' style=\"height:$(prop 'headerHeight')px\" logo-url=\"$(prop 'logoUrl')\" stylesheet=\"$(prop 'georchestraStylesheet')\"></geor-header>"

if grep -q "<geor-header" "${DATAHUB_DIR}/index.html"; then
  echo "[INFO] geOrchestra: header already present."
  exit 0
fi

echo "[INFO] geOrchestra: adding header in the main page..."
sed -i "s#<body>#<body>${SNIPPET}#" ${DATAHUB_DIR}/index.html