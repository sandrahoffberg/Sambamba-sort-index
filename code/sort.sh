#!/usr/bin/bash

set -ex

source ./config.sh
source ./utils.sh

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
        ${sort_by} \
        ${match_mates} \
        ${uncompress_chunks} \
        ${compress_int} \
        -t "${num_threads}" \
        --show-progress \
        --tmpdir="${temp_dir}" \
        -o "../results/${prefix}/${prefix}.bam" \
        ${bamfile}

        echo "Finished Sorting!"

        if [ ${sort_by} == "coordinate" ];
        then

            echo "Beginning to Index"

            sambamba index \
            --show-progress \
            -t "${num_threads}" \
            ${check_bins} \
            "../results/${prefix}/${prefix}.bam" 

            echo "Finshed Indexing"

        else
            echo "Index is not being Generated."
        fi

    done
else
    echo "No Bam Files Were Found."
fi


