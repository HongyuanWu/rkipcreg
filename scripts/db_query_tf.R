# load required librar
library(RSQLite)
library(cRegulome)
library(tidyverse)

# define tf targets
tf <- data.frame(tf = rep(c('VEZF1', 'ERCC6'), times = c(3, 2)),
                        gene = c('PEBP1', 'PIK3C3', 'WDR45', 'PEBP1', 'TBC1D5'),
                 stringsAsFactors = FALSE)

# download database file
#get_db(destfile = 'data/cRegulome.db')

# query the database
# connect
conn <- dbConnect(SQLite(), 'data/cRegulome.db')

# correlations of tf with genes of interest in prad
tf_prad_targets <- get_tf(conn,
                          tf = unique(tf$tf),
                          study = 'PRAD',
                          targets_only = TRUE,
                          targets = unique(tf$gene))

# correlations of tf with genes of interest in all studies
tf_studies <- get_tf(conn,
                     tf = unique(tf$tf),
                     targets_only = TRUE,
                     targets = unique(tf$gene))

# correlations of tf with all targets in prad
tf_targets <- get_tf(conn,
                     tf = unique(tf$tf),
                     study = 'PRAD',
                     targets_only = TRUE)

# correlations of tf with all targets in all studies
tf_all_studies <- get_tf(conn,
                         tf = unique(tf$tf),
                         targets_only = TRUE)

# upstream regulators of tf
all_tfs <- tbl(conn, 'targets_tf') %>%
  filter(feature %in% c('VEZF1', 'ERCC6')) %>%
  collect() %>%
  unique() %>%
  group_by(tf, study) %>%
  summarise(n = n()) %>%
  filter(n > 1)

upstream_tfs <- filter(all_tfs, study == 'PRAD') %>%
  pull(tf) %>%
  unique()

upstream <- get_tf(conn,
                   tf = upstream_tfs,
                   study = 'PRAD',
                   targets_only = TRUE,
                   targets = c('VEZF1', 'ERCC6'))

loop <- get_tf(conn, 
               tf = c('VEZF1', 'ERCC6'),
               targets_only = TRUE,
               targets = c('VEZF1', 'ERCC6'))
  
dbDisconnect(conn)

save.image('data/tf.rda')