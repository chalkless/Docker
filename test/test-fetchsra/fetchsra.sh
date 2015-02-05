#!/bin/bash

grep $1 SRA_Accessions.tab | perl -F"\t" -lane 'if ($F[6] eq "RUN") {$exp = $F[10]; $run = $F[0]; $exp_prefix = substr($exp, 0, 3); $exp_short = substr($exp, 0, 6); print "ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/${exp_prefix}/${exp_short}/${exp}/${run}/${run}.sra"}'

