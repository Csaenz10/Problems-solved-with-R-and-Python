setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

#!/bin/bash

# concatenate files
# blast search new file
# save results into new file and view

# Bash script to concatenate the two fasta files into a new file (catfiles.sh), done in Ubuntu
cat 2019-USATXS-0703_Gobiidae-sp_Fish_R1_2019-11-12_H06.1.fasta 2019-USATXS-0202_Chasmoides-logimaxilla_Fish_F1_2019-11-19_C02.1.fasta > two_seqs.fasta | \
blastn -db nt -query two_seqs.fasta -outfmt "7 qseqid stitle saccver qcovs pident evalue qseq" -max_target_seqs 20 -out results_twoseqs.out -remote

# Load the following libraries
library(tidyverse)

# Read in the data
SpID_Match<-read_tsv("tophit4.tsv")

# Rplot1.png 
ggplot(data = SpID_Match) +
  geom_bar(mapping = aes(x = SpIdMatch))

# Rplot02.png
ggplot(data = SpID_Match) +
  geom_bar(mapping = aes(x = SpIdMatch, fill = MatchQuality))

# Rplot03.png
ggplot(data = SpID_Match, mapping = aes(x = Err_MatchQual, y = PctIdentity)) + 
  geom_boxplot()



