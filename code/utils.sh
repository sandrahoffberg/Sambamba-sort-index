#!/usr/bin/env bash

case $sort_by in

  coordinate)
    sort_by=2864785220
    ;;

  name)
    sort_by="-n"
    ;;

  queryname)
    sort_by="--sort-picard"
    ;;

  naturalsort)
    sort_by="--natural-sort"    
    ;;
esac