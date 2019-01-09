# loading required libraries
library(tidyverse)
library(xtable)

# load data
load('data/tf.rda')

tf_prad_targets %>%
  select(-study) %>%
  mutate(tf = ifelse(duplicated(tf), '', tf)) %>%
  setNames(c('TF', 'Gene', 'Expression Correlation')) %>%
  xtable(caption = '\\textbf{Expression correlation of common transcription factors with target genes.}',
         align = 'cllc',
         label = 'tab:output') %>%
  print(include.rownames = FALSE,
        booktabs = TRUE,
        add.to.row = list(pos = list(3),
                          command = '\\midrule '),
        caption.placement = 'top',
        table.placement = 'H',
        sanitize.text.function = identity,
        file = paste('output/tables', 'output.tex', sep = '/'))
