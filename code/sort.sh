#!/usr/bin/bash
set -ex

source ./config.sh

echo "Number of Bam Files: $file_count"
echo "Using $num_threads Threads"

if [ "$file_count" -gt 0 ]; 
then

    for bamfile in ${bamfiles};
    do  
        prefix=$(basename $bamfile .bam)
        mkdir -p "../results/${prefix}"

        echo "Started to Sort"

        sambamba sort \
        -t "${num_threads}" \
        ${sort_by} \
        ${sort_picard} \
        ${natural_sort} \
        ${match_mates} \
        ${uncompress_chunks} \
        ${show_progress} \
        ${compress_int} \
        --tmpdir="${temp_dir}" \
        -o "../results/${prefix}/${prefix}.bam" \
        ${bamfile}

        echo "Finished Sorting!"
        echo "Beginning to Index"

        sambamba index \
        -t "${num_threads}" \
        ${show_progress} \
        ${check_bins} \
        "../results/${prefix}/${prefix}.bam" 

        echo "Finshed Indexing"

    done
else
    echo "No Bam Files Were Found."
fi


