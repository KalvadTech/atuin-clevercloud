#!/usr/bin/env bash
set -e
set -x
[ -z "$APP_HOME" ] && export APP_HOME=$(pwd)
[ -z "$ATUIN_VERSION" ] && export ATUIN_VERSION="14.0.1"

rm -rf $APP_HOME/atuin*
wget -O atuin.tar.gz https://github.com/ellie/atuin/releases/download/v${ATUIN_VERSION}/atuin-v${ATUIN_VERSION}-x86_64-unknown-linux-gnu.tar.gz
tar xvzf atuin.tar.gz
cp atuin-v${ATUIN_VERSION}-x86_64-unknown-linux-gnu/atuin ./
