# Docker env to run a testnet validator node for harmony

> https://staking.harmony.one/validators/testnet  

## Prerequisites

[Install hmy cli](https://docs.harmony.one/home/network/validators/node-setup/hmy-cli-download)  
[Create BLS keys](https://docs.harmony.one/home/network/validators/node-setup/generating-a-bls-key)  
[Create your validator](https://docs.harmony.one/home/network/validators/creating-a-validator)  
[Install and configure rclone](https://rclone.org/) see https://docs.harmony.one/home/network/validators/node-setup/syncing-db for configuration  

## Setup

The script will only work for shard0 => you need to edit `build_folder/run_testnet_node.sh` and `testnet/harmony-testnet.conf` if you want another $ONE  

> Copy your BLS keys into testnet/blskeys (mandatory)  
> Copy your harmony_db_0 into testnet/harmony_db_0 (optional)  

## Run your testnet node

`sh build_folder/run_testnet_node.sh`
