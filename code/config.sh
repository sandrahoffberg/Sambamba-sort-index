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

bamfiles=$(find -L ../data -name "*.bam")
file_count=$(echo $bamfiles | wc -w)

if [ -z "${1}" ]; then
  num_threads=$CO_CPUS
else
  if [ "${1}" -gt $CO_CPUS ]; then
    echo "Requesting more threads than available. Setting to Max Available."
    num_threads=$CO_CPUS
  else
    num_threads="${1}"
  fi
fi


if [ -z "${2}" ]; then
  compress_int="-l 5"
else
  compress_int="-l ${2}"
fi

if [ "${3}" == "qname" ]; then
  sort_by="-n"
else
  sort_by=""
fi

if [ "${4}" == "True" ]; then
  sort_picard="--sort-picard"
else
  sort_picard=""
fi

if [ "${5}" == "True" ]; then
  natural_sort="--natural-sort"
else
  natural_sort=""
fi

if [ "${6}" == "True" ]; then
  match_mates="--match-mates"
else
  match_mates=""
fi

if [ "${7}" == "True" ]; then
  uncompress_chunks="--uncompressed-chunks"
else
  uncompress_chunks=""
fi

if [ "${8}" == "True" ]; then
  show_progress="--show-progress"
else
  show_progress=""
fi

if [ "${9}" == "True" ]; then
  check_bins="--check-bins"
else
  check_bins=""
fi

temp_dir="../scratch/tmp"
