# Docker env to run a testnet validator node for Harmony

> https://staking.harmony.one/validators/testnet  

## Prerequisites

[Install hmy cli](https://docs.harmony.one/home/network/validators/node-setup/hmy-cli-download)  
[Create BLS keys](https://docs.harmony.one/home/network/validators/node-setup/generating-a-bls-key)  
[Create your validator](https://docs.harmony.one/home/network/validators/creating-a-validator)  
[Install and configure rclone](https://docs.harmony.one/home/network/validators/node-setup/syncing-db)  

## Setup

The script will only work for shard0 i.e you need to edit [run_testnet_node.sh](/build_folder/run_testnet_node.sh) and [harmony-testnet.conf](testnet/harmony-testnet.conf) if you want another $ONE  

- Copy your BLS keys into `testnet/blskeys` (mandatory)  
- Copy your harmony_db_0 folder into `testnet/` (optional)  

## Run your testnet node

`sh build_folder/run_testnet_node.sh`

## Network

RPC server => `0.0.0.0:10500`  
Auth-RPC server => `0.0.0.0:10501`  
WS server => `0.0.0.0:10800`  
Auth-WS server => `0.0.0.0:10801`  
