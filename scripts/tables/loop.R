# loading required libraries
library(tidyverse)
library(xtable)

# load data
load('data/tf.rda')

# generate table 
loop %>%
  mutate(study = str_split(study, '_', simplify = TRUE)[, 1]) %>%
  group_by(tf, feature) %>%
  summarise(n = n(),
            ave = mean(cor), sd = sd(cor),
            study = paste(study, collapse = ', ')) %>%
  setNames(c('TF', 'Gene', 'N', 'Average', 'SD', 'TCGA Studies')) %>%
  xtable(caption = '\\textbf{Positive feedback regulaiton between common transcription regulators.}',
         align = 'cllcccp{.25\\textwidth}',
         label = 'tab:loop') %>%
  print(include.rownames = FALSE,
        booktabs = TRUE,
        caption.placement = 'top',
        table.placement = 'H',
        sanitize.text.function = identity,
        comment = FALSE,
        file = paste('output/tables', 'loop.tex', sep = '/'))
