# loading required libraries
library(tidyverse)
library(ggridges)

# load data
load('data/tf.rda')

# generate figure
(tf_all_studies %>%
  ggplot(aes(x = cor, y = study)) +
  geom_density_ridges() +
  facet_wrap(~tf, nrow = 1) +
  theme_bw() +
  labs(y = '', x = "Expression Correlation")) %>%
  ggsave(plot = .,
         filename = 'output/figures/all_targets_studies.png',
         height = 18, width = 12, units = 'cm')
