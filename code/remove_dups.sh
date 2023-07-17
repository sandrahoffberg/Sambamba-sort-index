#!/usr/bin/bash
set -ex

source ./config.sh

file_count=$(find -L ../data -name "*.bam" | wc -l)
bamfiles=$(find -L ../data -name "*.bam")

echo "Number of input files: $file_count"
echo "Using $num_threads threads"

filter_string=""

if [ $min_read_quality -gt 0  ]; then
    filter_string="mapping_quality >= ${min_read_quality}"
    if [ $filter_unaligned == "True" ] || [ $filter_multimappers == "True" ]; then
        filter_string=$filter_string" and "
    fi
fi

if  [ $filter_unaligned == "True" ] && [ $filter_multimappers == "True" ]; then
    filter_string=$filter_string"not (unmapped or secondary_alignment or mate_is_unmapped) and not ([XA] != null)"
elif [ $filter_unaligned == "True" ]; then
    filter_string=$filter_string"not (unmapped or mate_is_unmapped)"
elif [ $filter_multimappers == "True" ]; then
    filter_string=$filter_string"not (secondary_alignment) and not ([XA] != null)"
fi

echo "Filter string $filter_string"

if [ "$file_count" -gt 0 ]; 
then
    for bamfile in ${bamfiles};
    do  
        filename=$(basename -a $bamfile)
        prefix=$(get_read_prefix.py "$filename" "0")
        mkdir -p "../results/${prefix}"
        if [ $filter_dups == "True" ]; then
            sambamba markdup -t "${num_threads}" -l "${compress_int}" ${remove} "${bamfile}" "../results/${prefix}/${prefix}.tmp.bam" --tmpdir="${temp_dir}"
        else
            cp "${bamfile}" "../results/${prefix}/${prefix}.tmp.bam"
        fi

        if [ $filter_unaligned == "True" ] ||  [ $filter_multimappers == "True" ] || [ $min_read_quality -gt 0 ]; 
        then 
            sambamba view \
            -t $num_threads \
            -h \
            -f bam \
            -F "$filter_string" \
            "../results/${prefix}/${prefix}.tmp.bam" \
            -o "../results/${prefix}/${prefix}.tmp2.bam"
        else
            mv "../results/${prefix}/${prefix}.tmp.bam" "../results/${prefix}/${prefix}.tmp2.bam"
        fi

        if [ "$sort_bams" = "True" ]; 
        then
            sambamba sort -t "${num_threads}" --tmpdir="${temp_dir}" -o "../results/${prefix}/${prefix}.bam" "../results/${prefix}/${prefix}.tmp2.bam"
            sambamba index -t "${num_threads}" "../results/${prefix}/${prefix}.bam"
        else
            mv "../results/${prefix}/${prefix}.tmp2.bam" "../results/${prefix}/${prefix}.bam"
        fi

        rm ../results/${prefix}/${prefix}.tmp.bam*
        rm ../results/${prefix}/${prefix}.tmp2.bam*
    done
else
    echo "No Bam Files Were Found."
fi


