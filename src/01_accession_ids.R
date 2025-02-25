library(dplyr)

# Path of the alignment
# For the 30_sequences 
#path <- "./data/30_sequences/muscle-I20250220-192936-0490-3990099-p1m.aln-fasta"
# For the 146 sequences
path <- "./data/146_sequences/muscle-I20250225-135904-0600-11760939-p1m.aln-fasta"

# Read file
alignment_lines <- readLines(path)

# Extract IDs (in the fasta file, lines starting with ">")
sequence_ids <- alignment_lines[grepl("^>", alignment_lines)]
# Remove ">" from the IDs
sequence_ids <- gsub("^>", "", sequence_ids)
print(sequence_ids)  # It retrieves all, the accession ids and the descriptions. 

# Substring, obtain only the first 1 character (only the accession ids) 
# Extract only the first 10 characters (Accession IDs)
accession_ids <- substr(sequence_ids, 1, 10)

# Print the result
print(accession_ids)

# Create a dataframe
df_ids <- data.frame(ID = accession_ids, stringsAsFactors = FALSE)

# Output path for the 30 sequences
#output_path <- "./data/30_sequences/alignment_ids.csv"
# Output path for the 146 sequences
output_path <- "./data/146_sequences/alignment_ids_broad.csv"

# Save to CSV file
write.csv(df_ids, output_path, row.names = FALSE)



