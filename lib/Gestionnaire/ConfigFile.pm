package Gestionnaire::ConfigFile;

use strict;
use warnings;
use Carp;
use Moose;
use Gestionnaire::Validation;

has 'Gestfile', isa => 'Str', is => 'ro';

sub gest_config_file {
    my $path = shift;
    return Config::IniFiles->new( -file => $path );
}

sub roots {
    my ($self) = @_;
    my $inih = gest_config_file( $self->Gestfile );
    my $roots = $inih->val( 'Gest', 'roots' );
    my @roots = split /[,]/smx, $roots;
    foreach my $root (@roots) {
        identifier($root) or croak;
    }
    return [@roots];
}

1;
