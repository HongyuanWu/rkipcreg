# loading required libraries
library(tidyverse)
library(cRegulome)

# load data
load('data/tf.rda')

(tf_prad_targets %>%
    cTF() %>%
    cor_plot() +
  theme(legend.position = 'top',
        legend.box = 'vertical',
        legend.spacing.y = unit(-.2, 'cm')) +
  scale_size_continuous(limits = c(-1,1)) +
  labs(x = '', y = 'Target Genes',
       color = 'Direction',
       size = 'Correlation')) %>%
  ggsave(plot = .,
         filename = 'output/figures/dot.png',
         height = 10, width = 10, units = 'cm')
