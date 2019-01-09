# loading required libraries
library(tidyverse)
library(cRegulome)
library(grid)
library(gridExtra)

# load data
load('data/tf.rda')

# generate graph
tf_targets %>%
  cTF() %>%
  cor_upset()
  
grid.edit('arrange', name = 'p1')
p1 <- grid.grab()

ggsave(plot = p1,
         filename = 'output/figures/upset.png',
         width = 10, height = 10, units = 'cm')
