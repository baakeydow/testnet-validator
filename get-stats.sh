#!/usr/bin/env bash

echo "local shard0 headers =>\n" && \
hmy blockchain latest-headers -n localhost:10500 && \
echo "\nharmony shard0 headers =>\n" && \
hmy blockchain latest-headers -n https://api.s0.b.hmny.io 
