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


# Alignment
bamfiles=$(find -L ../data -name "*.bam")
file_count=$(echo $bamfiles | wc -w)

if [ -z "${1}" ]; then
  num_threads=$(get_cpu_count)
else
  if [ "${1}" -gt $(get_cpu_count) ]; then
    echo "Requesting more threads than available. Setting to Max Available."
    num_threads=$(get_cpu_count)
  else
    num_threads="${1}"
  fi
fi

if [ -z "${2}" ]; then
  compress_int="-l 5"
else
  compress_int="-l ${2}"
fi

if [ -z "${3}" ]; then
    sort_by="coordinate"
else
    sort_by="${3}"
fi

if [ "${4}" == "True" ]; then
  match_mates="--match-mates"
else
  match_mates=""
fi

if [ "${5}" == "True" ]; then
  uncompress_chunks="--uncompressed-chunks"
else
  uncompress_chunks=""
fi

if [ "${6}" == "True" ]; then
  check_bins="--check-bins"
else
  check_bins=""
fi


temp_dir="../scratch/tmp"
