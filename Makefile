#!/bin/bash

all: data/tf.rda \
	output/figures/all_targets_studies.png \
	output/figures/dot.png \
	output/figures/network.png \
	output/figures/joy.png \
	output/figures/upset.png \
	output/tables/output.tex \
	output/tables/loop.tex \
	output/tables/upstream.tex \
	output/tables/repeated_interactions.tex \
	clean
	
data/tf.rda: scripts/db_query_tf.R data/cRegulome.db
	R CMD BATCH --vanila scripts/db_query_tf.R > log/db_query_tf.Rout

output/figures/%.png: scripts/figures/%.R data/*
	R CMD BATCH --vanila $< log/$(<F).Rout

output/tables/%.tex: scripts/tables/%.R data/*
	R CMD BATCH --vanila $< log/$(<F).Rout
	
# clean up
clean:
	rm -f *.pdf
	rm -f *.RData
