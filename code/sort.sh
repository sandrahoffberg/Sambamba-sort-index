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


        if [ -z $sort_by ] || [ $sort_by != "none" ]; 
        then 
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
        else
            cp ${bamfile} "../results/${prefix}/${prefix}.bam"
        fi

        NOT_SORTED=0

        sambamba index \
        --show-progress \
        -t "${num_threads}" \
        ${check_bins} \
        "../results/${prefix}/${prefix}.bam" || NOT_SORTED=$?

        if [ $NOT_SORTED != 0 ];
        then
            echo "../results/${prefix}/${prefix}.bam not coordinate sorted, no index generated"
            rm ../results/${prefix}/${prefix}.bam.bai
        else
            echo "Finished Indexing"
        fi

        echo "Finshed Indexing"


    done
else
    echo "No Bam Files Were Found."
fi


