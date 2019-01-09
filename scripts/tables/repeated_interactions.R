# loading required libraries
library(tidyverse)
library(xtable)

# load data
load('data/tf.rda')

# generate table
tf_studies %>%
  mutate(study = str_split(study, '_', simplify = TRUE)[, 1]) %>%
  group_by(tf, feature) %>%
  summarise(n = n(),
            study = paste0(study, collapse = ', ')) %>%
  right_join(select(tf, feature = gene)) %>%
  unique() %>%
  arrange(tf, desc(n)) %>%
  filter(grepl('PRAD', study)) %>%
  ungroup() %>%
  mutate(tf = ifelse(duplicated(tf), '', tf)) %>%
  setNames(c('TF', 'Gene', 'N', 'TCGA Studies')) %>%
  xtable(caption = '\\textbf{Repeated common regulatory interactions in other cancer studies.}',
         align = 'cllcp{.25\\textwidth}',
         label = 'tab:repeated_interactions') %>%
  print(include.rownames = FALSE,
        booktabs = TRUE,
        add.to.row = list(pos = list(2),
                          command = '\\midrule '),
        caption.placement = 'top',
        table.placement = 'H',
        sanitize.text.function = identity,
        file = paste('output/tables', 'repeated_interactions.tex', sep = '/'))

