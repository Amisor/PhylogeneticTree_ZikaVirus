library(dyplr)

# Path of the alignment
path <- "./data/30_sequences/muscle-I20250220-192936-0490-3990099-p1m.aln-fasta"
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

# Define output path
output_path <- "./data/30_sequences/alignment_ids.csv"
# Save to CSV file
write.csv(df_ids, output_path, row.names = FALSE)



