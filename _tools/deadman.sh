#!/bin/bash
# If file is more than 25 hours old, fail.
if test `find "$HOME/air.deadman" -mmin +1500`
then
    echo "Today is "`date`" but air.deadman is:"
    ls -l $HOME/air.deadman
    exit 1
fi

EXP=`~/get_experiment_percentage`
if [ $EXP -ne 0 ]
then
  echo "-- An experiment is running at $EXP percent --"
  exit 1
fi
exit 0
