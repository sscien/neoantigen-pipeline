#!/bin/bash
#BSUB -J j1_fa_C3L-01598.sh
f_vcf_indel=/storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_pipeline/neoscan/EJ_testing/PDA/C3N-001598/C3L-01598/C3L-01598.indel.vcf
f_vcf_snp=/storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_pipeline/neoscan/EJ_testing/PDA/C3N-001598/C3L-01598/C3L-01598.snp.vcf
f_fa_indel_wt=/storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_pipeline/neoscan/EJ_testing/PDA/C3N-001598/C3L-01598/C3L-01598.indel.vcf.fa-indel-wt.fasta
f_fa_indel_mut=/storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_pipeline/neoscan/EJ_testing/PDA/C3N-001598/C3L-01598/C3L-01598.indel.vcf.fa-indel-mut.fasta
f_fa_snv_wt=/storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_pipeline/neoscan/EJ_testing/PDA/C3N-001598/C3L-01598/C3L-01598.snp.vcf.fa-snv-wt.fasta
f_fa_snv_mut=/storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_pipeline/neoscan/EJ_testing/PDA/C3N-001598/C3L-01598/C3L-01598.snp.vcf.fa-snv-mut.fasta
f_fa_all=/storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_pipeline/neoscan/EJ_testing/PDA/C3N-001598/C3L-01598/C3L-01598.transcript.fa
if [ -s $f_vcf_snp ]
then
 /usr/bin/perl ./fasta_seq_for_snv_using_refseq_bed.pl hg38_RefSeq.bed /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_pipeline/neoscan/EJ_testing/PDA/C3N-001598/neoscan ${f_vcf_snp}
cat ${f_fa_snv_mut} > ${f_fa_all}
fi

if [ -s $f_vcf_indel ]
then
 /usr/bin/perl ./fasta_seq_for_indel_using_refseq_bed.pl hg38_RefSeq.bed /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_pipeline/neoscan/EJ_testing/PDA/C3N-001598/neoscan ${f_vcf_indel}
cat ${f_fa_indel_mut} >> ${f_fa_all}
fi
