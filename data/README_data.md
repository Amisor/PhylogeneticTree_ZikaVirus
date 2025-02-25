# Data

The data directory is divided into two directories: 30_sequences and 146_sequences. The first directory contains the information related to the GenBank query that 
exaclty macthes the first result of NCBI BLAST, while the 146_sequences contains the data related to the GenBank query with a broader term of the first result of NCBI BLAST.

## 30_sequences

`sequence.fasta`: The 30 sequences from the GenBank query "Zika virus envelope protein (E) gene".
Note that GenBank queries are not case-sensitive. Sequences length were restricted from 1 to 1000 nucleotides.

`muscle-I20250220-192936-0490-3990099-p1m.aln-fasta`: Aligment of the 30 sequences resulting from MUSCLE with Pearson/FASTA output format.

`simple_phylogeny-I20250220-194601-0208-89474678-p1m.tree`: Phylogeny tree of the 30 aligneed sequences resulting from Simply Phylogeny with default parameters and Neighbor-Joining analysis (
Phylip tree format, distance correction off, exclude gaps off, clustering methods Neighbor-joining, percent identity matrix off).

`alignment_ids.csv`: Accesion IDs obtained from the aligmnet file. It's the output of the code 01_accession_ids.R 

`metadata_ids.csv`: Metadata containing the country of origin from the accession IDs. It's the output of the code 02_metadata_ids.R.

`iTOL_metadata.txt`: The metadata file for iTOL. It's the output of the code 03_iTOL_metadata.R

## 146_sequences

`sequence_broad.fasta`: The 146 sequences from the GenBank query "Zika virus envelope protein". Sequences length were restricted from 1 to 1000 nucleotides.

`muscle-I20250225-135904-0600-11760939-p1m.aln-fasta`: Aligment of the 146 sequences resulting from MUSCLE with Pearson/FASTA output format.

`simple_phylogeny-I20250225-140502-0931-8025153-p1m.tree`: Phylogeny tree of the 146 aligned sequences resulting from Simply Phylogeny with default parameters and Neighbor-Joining analysis (
Phylip tree format, distance correction off, exclude gaps off, clustering methods Neighbor-joining, percent identity matrix off).

`alignment_ids_broad.csv`: Accesion IDs obtained from the aligmnet file. It's the output of the code 01_accession_ids.R 

`metadata_ids_broad.csv`: Metadata containing the country of origin from the accession IDs. It's the output of the code 02_metadata_ids.R.

`iTOL_metadata_broad.txt`: The metadata for iTOL. It's the output of the code 03_iTOL_metadata.R
