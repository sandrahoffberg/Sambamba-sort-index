[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# Sort reads in a BAM file Mark using Sambamba

This capsule requires alignment files in bam format. Sambamba can filter out poor mapping quality, duplicates, secondary/multimapped and unmapped reads from your alignment file. It will return your processed bam file to the results folder.

[Documentation](https://lomereiter.github.io/sambamba/docs/sambamba-markdup.html)


## Input data

**\*.bam** files in the **/data** directory

## Outputs

.bam files in individual folders (optionally sorted with index files)

## App Panel Parameters

Number of Threads
- Number of threads reserved for sambamba


Compression
- specify compression level of the resulting file (from 0 to 9)

Sort by
- coordinate: integer reference ID [Default]
- qname: lexicographically by name

## Other Notes

This capsule is an alternative to ```samtools markdup``` and ```picard markduplicates```. 

## Source 

https://github.com/biod/sambamba

## Cite

```A. Tarasov, A. J. Vilella, E. Cuppen, I. J. Nijman, and P. Prins. Sambamba: fast processing of NGS alignment formats. Bioinformatics, 2015.```

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)
