#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $(basename $0) num-shards"
  exit 1
fi

cd ~/iterm2.com/appcasts

if [ ! -d experiment ]; then
  echo "In wrong directory"
  exit 1
fi

if [ ! -d control ]; then
  echo "In wrong directory"
  exit 1
fi

NUM_SHARDS=100
NUM_EXPERIMENT=$1

if [ $NUM_EXPERIMENT -lt 0 ]; then
  echo num-shards must not be negative
  exit 1
fi

if [ $NUM_EXPERIMENT -gt $NUM_SHARDS ]; then
  echo num-shards must not exceed $NUM_SHARDS
  exit 1
fi

if [ $NUM_EXPERIMENT -gt 0 ]; then
  # Set first $NUM_EXPERIMENT shards to point at experiment
  echo Set shards 0 to $(($NUM_EXPERIMENT-1)) to experiment 
  for x in `seq 0 $(($NUM_EXPERIMENT-1))`; do
  ln -sfn experiment shard-$x
  done
fi

if [ $NUM_EXPERIMENT -lt $NUM_SHARDS ]; then 
  # Set remaining shards to point at control.
  LAST_SHARD=$(($NUM_SHARDS-1))
  echo Set shards $NUM_EXPERIMENT to $LAST_SHARD to control
  for x in `seq $NUM_EXPERIMENT $LAST_SHARD`; do
  ln -sfn control shard-$x
  done
fi

