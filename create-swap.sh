#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: create-swap.sh <amount of MB>"
  exit 1
fi

if [ -e /vol0/swap ]; then
  echo "/vol0/swap already exists" >&2
  exit 1
fi

SWAP_MB=$1
if [[ "$SWAP_MB" != "0" ]]; then
  dd if=/dev/zero of=/vol0/swap bs=1M count=$SWAP_MB
  mkswap /vol0/swap
  swapon /vol0/swap
  echo "Added $SWAP_MB MB swap file /vol0/swap"
fi
