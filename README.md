[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# Sambamba Sort & Index

## Inputs

**\*.bam** files in the **/data** directory

## Outputs

A folder for each sample containing a sorted .bam file and (if you have selected Generate Index) .bai index.

## App Panel Parameters

Number of Threads
- Number of threads reserved for sambamba

Compression
- specify compression level of the resulting file (from 0 to 9) [Default: 5]

Sort By
- coordinate: integer reference ID [Default]
- qname: lexicographically by name
- queryname : sort by query name like in picard
- naturalsort: sort by read name instead of coordinate (so-called 'natural' sort as in samtools)

Match Mates
- pull mates of the same alignment together when sorting by read name

Uncompressed Chunks
- write sorted chunks as uncompressed BAM (default is writing with compression level 1), that might be faster in some cases but uses more disk space

Check Bins
- check that bins are set correctly

## Source 

- https://github.com/biod/sambamba <br>
- [Sorting](https://lomereiter.github.io/sambamba/docs/sambamba-sort.html)
- [Indexing](https://lomereiter.github.io/sambamba/docs/sambamba-index.html)

## Cite

A. Tarasov, A. J. Vilella, E. Cuppen, I. J. Nijman, and P. Prins. Sambamba: fast processing of NGS alignment formats. Bioinformatics, 2015.

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)
