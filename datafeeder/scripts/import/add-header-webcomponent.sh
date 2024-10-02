#!/bin/sh

# To be properly executed by datafeeder initialization need the +x flag
# so you need to add it with chmod and commit/push it

DATAFEEDER_DIR=${1:-/usr/share/nginx/html}
# SNIPPET="<script src='https://cdn.jsdelivr.net/gh/georchestra/header@dist/header.js'></script><geor-header active-app='import' style='height:90px'></geor-header>"
SNIPPET='<script src='https://cdn.jsdelivr.net/gh/georchestra/header@dist/header.js'></script><geor-header style="width:100%;height:90px;border:none;" active-app="import" legacy-url="/header/" legacy-header="false" logo-url="https://www.regions-departements-france.fr/images/regions/drapeau/drapeau-region-occitanie-300.jpg"></geor-header>'

if grep -q "${SNIPPET}" "${DATAFEEDER_DIR}/index.html"; then
  echo "[INFO] geOrchestra: header already present."
  exit 0
fi

echo "[INFO] geOrchestra: adding header in the main page..."
sed -i "s#<body class=\"m-0 h-full flex flex-col\">#<body class=\"m-0 h-full flex flex-col\">${SNIPPET}#" ${DATAFEEDER_DIR}/index.html
