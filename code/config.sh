#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
else
  echo "args:"
  for i in $*; do 
    echo $i 
  done
  echo ""
fi

if [ -z "${1}" ]; then
  num_threads=$(get_cpu_count.py)
else
  num_threads="${1}"
fi


if [ -z "${2}" ]; then
  compress_int=5
else
  compress_int="${2}"
fi


if [ "${3}" == "coordinate" ]; then
  sort_by="coordinate"
else
  sort_by="qname"
fi


temp_dir="../scratch/tmp"
