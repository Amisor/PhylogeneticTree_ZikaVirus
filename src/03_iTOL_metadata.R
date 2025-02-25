library(dplyr)

# Read metadata file
# For the 30 sequences
metadata_path = "./data/30_sequences/metadata_ids.csv"
# For the 146 sequences
#metadata_path = "./data/146_sequences/metadata_ids_broad.csv"
metadata <- read.csv(metadata_path)

# List unique countries and assign colors
unique_countries <- unique(metadata$m.country)

# Generate a color palette (one unique color per country)
set.seed(42)
colors <- grDevices::rainbow(length(unique_countries)) 

# Create a mapping of countries to hex colors
country_colors <- setNames(colors[1:length(unique_countries)], unique_countries)

# Create iTOL metadata content
itol_metadata <- c(
  "DATASET_COLORSTRIP",
  "SEPARATOR TAB",
  "DATASET_LABEL\tSample Origin",
  "COLOR\t#000000",
  paste("FIELD_LABELS\t", paste(unique_countries, collapse = "\t")),
  paste("FIELD_COLORS\t", paste(country_colors, collapse = "\t")),
  "DATA"
)

# Format the data section to include the Accession ID and the corresponding **color**, NOT the country name
for (i in 1:nrow(metadata)) {
  itol_metadata <- c(itol_metadata, paste(metadata$m.ID[i], country_colors[metadata$m.country[i]], sep = "\t"))
}

# Write txt for iTOL
# For the 30 sequences
itol_output ="./data/30_sequences/iTOL_metadata.txt"
# For the 146 sequences
#itol_output ="./data/146_sequences/iTOL_metadata_broad.txt"
writeLines(itol_metadata, itol_output)

# Print preview
cat(itol_metadata, sep = "\n")


