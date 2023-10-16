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

        sambamba index \
        -t "${num_threads}" \
        "../results/${prefix}/${prefix}.bam"

    done
else
    echo "No Bam Files Were Found."
fi


