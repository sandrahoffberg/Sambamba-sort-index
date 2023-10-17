#!/usr/bin/env bash

case $sort_by in

  coordinate)
    sort_by=""
    match_mates="" #Match mates cannot be set with coordinate sorting
    ;;

  name)
    sort_by="--sort-by-name"
    ;;

  picard)
    sort_by="--sort-picard"
    match_mates="" #Match mates cannot be set with coordinate sorting
    ;;

  natural)
    sort_by="--natural-sort"    
    ;;
esac