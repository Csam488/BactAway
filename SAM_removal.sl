sampleid = $1
#
samtools view -h $sampleid\.bam | awk '/^@/ || sqrt($9*$9) > 30' | samtools view -bS - > $sampleid\_1.bam
#
samtools view -h $sampleid\.bam | awk '/^@/ || sqrt($9*$9) < 1' | samtools view -bS - > $sampleid\_2.bam
#
samtools merge $sampleid\_debact.bam $sampleid\_1.bam $sampleid\_2.bam
#
rm $sampleid\_1.bam $sampleid\_2.bam
#
samtools index $sampleid\_debact.bam
