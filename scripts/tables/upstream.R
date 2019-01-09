# loading required libraries
library(tidyverse)
library(xtable)

# load data
load('data/tf.rda')
type <- data_frame(tf = c('BMI1', 'CREBBP', 'EP400', 'GABPA', 'MECP2', 'SMAD4', 'WWTR1'),
                   type = c('Chromatin remodeling', 'Transcription co-activation', 'Chromatin remodeling',
                     'Transcription factor', 'Transcription repression', 'Transcription regulation',
                     'Transcription co-repression'))
# generate table
upstream %>%
  select(-study) %>%
  spread(feature, cor) %>%
  left_join(type) %>%
  setNames(c('TF', 'ERCC6', 'VEZF1', 'Role')) %>%
  xtable(caption = '\\textbf{Upstream regulators of common transcription factors in prostate cancer.}',
         align = 'clccl',
         label = 'tab:upstream') %>%
  print(include.rownames = FALSE,
        booktabs = TRUE,
        caption.placement = 'top',
        table.placement = 'H',
        sanitize.text.function = identity,
        comment = FALSE,
        file = paste('output/tables', 'upstream.tex', sep = '/'))

