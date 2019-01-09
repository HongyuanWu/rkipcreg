# loading required libraries
library(tidyverse)
library(cRegulome)

# load data
load('data/tf.rda')

# generate graph
(tf_targets %>%
    cTF() %>%
    cor_joy() +
    labs(x = 'Expression Correlation', y = '') +
    scale_y_discrete(expand = c(0,0))) %>%
  ggsave(plot = .,
         filename = 'output/figures/joy.png',
         width = 10, height = 10, units = 'cm')
