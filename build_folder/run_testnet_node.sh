#!/usr/bin/env bash

ROOT_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
BUILD_DIR="$ROOT_DIR/build_folder"
DB_DIR="$ROOT_DIR/testnet/harmony_db_0"
BLS_DIR="$ROOT_DIR/testnet/blskeys"

if [ -f "$ROOT_DIR/testnet/harmony-testnet.conf" ];
then
  # check directory structure is right
  [ ! -d "$DB_DIR" ] && rclone -P -L sync release:pub.harmony.one/testnet.min/harmony_db_0 $ROOT_DIR/testnet/harmony_db_0 --multi-thread-streams 4 --transfers=8
  [ ! -d "$BLS_DIR" ] && echo "You need to have your BLS keys in this folder: $BLS_DIR ! for more information please visit => https://docs.harmony.one/home/network/validators/node-setup/generating-a-bls-key" && exit 1
  # delete old docker image if any
  docker rmi -f harmony_testnet_node:latest &>/dev/null || true
  # stop old container if any
  docker stop harmony_testnet &>/dev/null || true
  # build fresh image and run new container in detached mode
  cd $BUILD_DIR && docker build --no-cache --pull -t harmony_testnet_node:latest . && \
  docker run --rm --name harmony_testnet -d \
    -p 10000:10000 \
    -p 10500:10500 \
    -p 10800:10800 \
    -p 7000:7000 \
    -v "$ROOT_DIR/testnet:/root/workspace/testnet" harmony_testnet_node
  # attach to container to display logs
  docker exec -it harmony_testnet /bin/bash -c "tail -f testnet/latest/zerolog-harmony.log"
else
  echo "Nope that's not quite right... you need to call this script only from the project root directory"
  echo "You launched the script from $ROOT_DIR"
  exit 1
fi
