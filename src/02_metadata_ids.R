library(rentrez)
library(stringr)
library(dplyr)
library(tidyr)

# Read csv containing the IDs
# For the 30 sequences
#ids_path = "./data/30_sequences/alignment_ids.csv"
# For the 146 sequences
ids_path = "./data/146_sequences/alignment_ids_broad.csv"
strain_ids <- read.csv(ids_path)
print(strain_ids)

# Test function to know how the metadata looks like from entrez
test <- function(id) {
  # Query NCBI nucleotide database
  record <- entrez_fetch(db = "nucleotide", id = id, rettype = "gb", retmode = "text")
  return(record)
}

# When I print this result I noticed that the country metadata is in geo_loc_name
test("AF372422.1")

# Function to fetch metadata and extract country information
fetch_metadata <- function(id) {
  # Query NCBI for GenBank record
  record <- entrez_fetch(db = "nucleotide", id = id, rettype = "gb", retmode = "text")
  
  # Extract "geo_loc_name" field (which contains country information)
  country_match <- str_match(record, "/geo_loc_name=\"([^\"]+)\"")
  country <- ifelse(!is.na(country_match[,2]), country_match[,2], "Unknown")
  
  # Return data as a dataframe
  return(data.frame(ID = id, country_metadata = country, stringsAsFactors = FALSE))
}

# Apply function to all strain IDs
metadata_results <- bind_rows(lapply(strain_ids$ID, fetch_metadata))

# View results
print(metadata_results)

# Because some results include country and city, I'll create a new column only keeping the country 
m <- metadata_results %>%
  separate_wider_delim(country_metadata, delim = ":", names = c("country", "city"), too_few = "align_start")

# It worked
print(m)

# Keep columns of interest
final_metadata <- data.frame(m$ID, m$country)                 

# View results
print(final_metadata)

# Save results to a CSV file
# For the 30 sequences
#metadata_output = "./data/30_sequences/metadata_ids.csv"
# For the 146 sequences
metadata_output = "./data/146_sequences/metadata_ids_broad.csv"
write.csv(final_metadata, metadata_output, row.names = FALSE)
