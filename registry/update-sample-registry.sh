#!/usr/bin/env bash
set -e

DIR=$(cd $(dirname $0) && pwd)
pushd "$DIR" > /dev/null
  . _functions.sh

  pushd "$REGISTRY_DIR" > /dev/null
    array=( \
      "index.docker.io/cnbs/sample-package:hello-world" \
      "index.docker.io/cnbs/sample-package:hello-universe" \
    )
    for IMAGE in "${array[@]}"
    do
      echo "---> Updating $IMAGE..."
      generate_registry_entry "$IMAGE"
    done
  popd > /dev/null
popd > /dev/null