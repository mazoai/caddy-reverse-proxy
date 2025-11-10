#!/bin/sh

set -euo pipefail

# for backwards compatibility, seperates host and port from url
export FRONTEND_DOMAIN=${FRONTEND_DOMAIN:-${FRONTEND_HOST%:*}}
export FRONTEND_PORT=${FRONTEND_PORT:-${FRONTEND_HOST##*:}}

export BACKEND_DOMAIN=${BACKEND_DOMAIN:-${BACKEND_HOST%:*}}
export BACKEND_PORT=${BACKEND_PORT:-${BACKEND_HOST##*:}}

export DATABASE_API_DOMAIN=${DATABASE_API_DOMAIN:-${DATABASE_API_HOST%:*}}
export DATABASE_API_PORT=${DATABASE_API_PORT:-${DATABASE_API_HOST##*:}}

# strip https:// or https:// from domain if necessary
FRONTEND_DOMAIN=${FRONTEND_DOMAIN##*://}
BACKEND_DOMAIN=${BACKEND_DOMAIN##*://}
DATABASE_API_DOMAIN=${DATABASE_API_DOMAIN##*://}

echo using frontend: ${FRONTEND_DOMAIN} with port: ${FRONTEND_PORT}
echo using backend: ${BACKEND_DOMAIN} with port: ${BACKEND_PORT}
echo using database-api: ${DATABASE_API_DOMAIN} with port: ${DATABASE_API_PORT}

exec caddy run --config Caddyfile --adapter caddyfile 2>&1