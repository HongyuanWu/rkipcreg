# loading required libraries
library(tidyverse)
library(cRegulome)
library(igraph)

# load data
load('data/tf.rda')

# generate figure
png(filename = 'output/figures/network.png',
    width = 12, height = 12, units = 'cm', res = 300)

tf_prad_targets %>%
  cTF() %>%
  cor_igraph(directed = TRUE) %>%
  plot(vertex.color = 'gray',
       vertex.frame.color = 'gray',
       vertex.label.color = 'black',
       vertex.size = 25)

dev.off()

