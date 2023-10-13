#!/usr/bin/bash
set -ex

source ./config.sh


echo "Number of input files: $file_count"
echo "Using $num_threads threads"

if [ "$file_count" -gt 0 ]; 
then
    for bamfile in ${bamfiles};
    do  
        prefix=$(basename $bamfile .bam)
        mkdir -p "../results/${prefix}"

        sambamba sort -t "${num_threads}" ${sort_by} -l ${compress_int} --tmpdir="${temp_dir}" -o "../results/${prefix}/${prefix}.bam" ${bamfile}
        sambamba index -t "${num_threads}" "../results/${prefix}/${prefix}.bam"

    done
else
    echo "No Bam Files Were Found."
fi


