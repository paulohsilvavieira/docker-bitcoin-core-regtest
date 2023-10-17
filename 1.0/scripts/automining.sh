#!/bin/bash

echo "start mining..."

while true; do
    bitcoin-cli -regtest -conf=/bitcoin/bitcoin.conf -rpcwallet="bitcoin-wallet-regtest" -generate 1
    sleep 10
done
