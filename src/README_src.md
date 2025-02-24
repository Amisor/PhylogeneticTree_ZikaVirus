# Source code

The following is a description of each R code to generate the metadata for iTOL. 

* `01_accesion_ids.R`: It's in charge of creating a csv file that contains all the IDs for the tree. The IDs are retreive from the fasta file that MUSCLE gave me when 
performing the multiple alignment. The script is based on the format of FASTA files, so it identifies the IDs by looking for the ">" character in the MUSCLE alignment file.
* `02_metadata_ids.R`: It uses rentrez to obtain the metadata information of the IDs. It looks for the country information, which is saved as "geo_loc_name" in the metadata.
Saves the metadata output as a csv file, which only contains the IDs and their respective country of origin. 
* `03_iTOL_metadata.R`: Creates a txt that will serve as an input for iTOL. The txt assigns a color to each ID depending on its country of origin. 


