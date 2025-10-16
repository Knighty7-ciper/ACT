#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../../config/docker"
docker compose -f docker-compose.prod.yml up --build -d
