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
        -t "${num_threads}" \
        ${sort_by} \
        ${match_mates} \
        ${uncompress_chunks} \
        ${show_progress} \
        ${compress_int} \
        --tmpdir="${temp_dir}" \
        -o "../results/${prefix}/${prefix}.bam" \
        ${bamfile}

        echo "Finished Sorting!"

        if [ ${generate_index} -eq 1 ];
        then

            echo "Beginning to Index"

            sambamba index \
            -t "${num_threads}" \
            ${show_progress} \
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


