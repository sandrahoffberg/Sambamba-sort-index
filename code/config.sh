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

if [ "$2" = "mark" ]; then
  remove=""
else
  remove="-r"
fi

if [ -z "${3}" ]; then
  compress_int=5
else
  compress_int="${3}"
fi

if [ -z "${4}" ]; then
  sort_bams="True"
else
  sort_bams="${4}"
fi

if [ -z "${5}" ]; then
  filter_dups="True"
else
  filter_dups="${5}"
fi

if [ -z "${6}" ]; then
  filter_unaligned="False"
else
  filter_unaligned="${6}"
fi

if [ -z "${7}" ]; then
  filter_multimappers="False"
else
  filter_multimappers="${7}"
fi

if [ -z "${8}" ]; then
  min_read_quality=0
else
  min_read_quality="${8}"
fi

temp_dir="../scratch/tmp"
