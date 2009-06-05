#!/usr/bin/perl
# Organizer of directories
# pmoranga at gmail dot com
#
# http://github.com/pmoranga/FilenameOrganizer

if (scalar(@ARGV)==0){
    print "usage: $0 [FILES]\n";
}

@files=@ARGV;

foreach $i (@files){
	if ( $i =~ m/([ %+]|\..{4})/ ) {
		my $o = $i;
		$i =~ s/\n//g;
		$o =~ s/\n//g;
		$i =~ s/%(..)/pack("c",hex($1))/ge;
		$i =~ s/\+/_/g;
                $i =~ s/ /_/g;
		$i = &trocaPonto($i);
	        if ( rename($o, $i) ){
			print "$o -> $i\n";
		}
		else {
		        warn "Couldn't rename $o to $i: $!\n";
		}
	}
}
 
sub trocaPonto(){
    $nome = shift(@_);
    while ( $nome =~ m/\..{4}/){
	$nome =~ s/\./_/;
    }
    return ($nome);
}
