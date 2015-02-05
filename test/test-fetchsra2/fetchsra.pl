#!/usr/bin/perl

$debug = 1;

$id_sra = shift @ARGV;

$file_idtable = "SRA_Accessions.tab";

open (TABLE, $file_idtable);
while (defined ($line_table = <TABLE>)) {
    $line_table =~ s/[\r\n]//g;

    @eles = split(/\t/, $line_table);
    if (($eles[0] eq $id_sra) or ($eles[1] eq $id_sra) or ($eles[11] eq $id_sra)) {
	    $id_study = $id_sra if $id_sra =~ /[SED]RP\d+/;
	    $id_study = $eles[12] if (($id_study eq "") and ($eles[12] ne "-"));
	    $id_biopj = $eles[18];
	    print join ("\t", $id_study, $id_biopj)."\n" if $debug == 2;
    }
}

seek (TABLE, 0, 0);

while (defined ($line_table = <TABLE>)) {
    $line_table =~ s/[\r\n]//g;

    @eles = split(/\t/, $line_table);
    if (($eles[6] eq "RUN") and ($eles[12] eq $id_study) and ($eles[18] eq $id_biopj)) {
	$exp = $eles[10];
	$run = $eles[0];
	$exp_prefix = substr($exp, 0, 3); 
	$exp_short = substr($exp, 0, 6); 
	print "ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/${exp_prefix}/${exp_short}/${exp}/${run}/${run}.sra"."\n";
    }
}
close (TABLE);


