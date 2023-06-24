#!/usr/bin/bash

bam=$1

for file in *.bam
do
    filename=`echo $bam | cut -d "." -f 1`
    samtools view -H $bam | sed -e 's/SN:\([0-9XY]\)/SN:chr\1/' -e 's/SN:MT/SN:chrM/' | samtools reheader - $bam > ${bam}_chr.bam
done

samtools index ${bam}_chr.bam
