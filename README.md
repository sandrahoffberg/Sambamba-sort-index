[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# Sort and index reads in a BAM file using Sambamba


## Input data

**\*.bam** files in the **/data** directory

## Outputs

A folder for each sample containing a sorted .bam file and .bai index

## App Panel Parameters

Number of Threads
- Number of threads reserved for sambamba

Compression
- specify compression level of the resulting file (from 0 to 9) [Default: 5]

Sort by
- coordinate: integer reference ID [Default]
- qname: lexicographically by name


## Source 

https://github.com/biod/sambamba <br>
[Documentation](https://lomereiter.github.io/sambamba/docs/sambamba-sort.html)

## Cite

A. Tarasov, A. J. Vilella, E. Cuppen, I. J. Nijman, and P. Prins. Sambamba: fast processing of NGS alignment formats. Bioinformatics, 2015.

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)
