#reads sequenciamento

library(ggplot2)
library(readr)     # for reading data
library(dplyr)     # for data wrangling
library(tidyr)  # for reshaping data
library(scales)

reads <- read.table("reads_perbarcode.txt", h=T)
head(reads)
reads$substrat <- as.factor(reads$substrat)
reads$repetition <- as.factor(reads$repetition)

#reads_QC_passed9
ggplot(reads, aes(x = substrat, y = (reads_QC_passed9), fill = substrat)) +
  geom_violin(trim = FALSE) +
  geom_jitter(width = 0.2, size = 1, alpha = 0.6) +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma) +
  labs(title = "Number of sequences showing high quality",
       y = "Number of reads", x = "Substrate")

# Violin plot for reads_cutadapt_lenght
ggplot(reads, aes(x = substrat, y = reads_cutadapt_lenght, fill = substrat)) +
  geom_violin(trim = FALSE) +
  geom_jitter(width = 0.2, size = 1, alpha = 0.6) +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma, limits=c(0, 300000)) +
  labs(title = "Number of sequences after filtering by size",
       y = "Number of reads", x = "Substrate")

# Violin plot for sequence_length_max
ggplot(reads, aes(x = substrat, y = sequence_length_max, fill = substrat)) +
  geom_violin(trim = FALSE) +
  geom_jitter(width = 0.2, size = 1, alpha = 0.6) +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma) +
  labs(title = "Average Sequence length per substrate",
       y = "Sequence Length", x = "Substrate")
