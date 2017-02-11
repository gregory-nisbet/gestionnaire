package Gestionnaire::Gestionnaire;
use strict;
use warnings;
use Exporter qw[import];
use Gestionnaire::ConfigFile;

sub read_config_file {
    my $path = shift;
    return Gestionnaire::ConfigFile->new( Gestfile => $path );
}

1;
