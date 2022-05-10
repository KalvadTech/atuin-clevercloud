#!/usr/bin/env bash
set -e
set -x
[ -z "$APP_HOME" ] && export APP_HOME=$(pwd)
[ -z "$ATUIN_CONFIG_DIR" ] && export ATUIN_CONFIG_DIR="$APP_HOME/config"

mkdir -p $ATUIN_CONFIG_DIR
cat <<EOF > $ATUIN_CONFIG_DIR/server.toml
host = "0.0.0.0"
port = 8080
open_registration = true
db_uri="$POSTGRESQL_ADDON_URI"
EOF

./atuin server start
