package Gestionnaire::Validation;
use strict;
use warnings;
use Exporter qw[import];
use Config::IniFiles;

our @EXPORT = qw[
  identifier
];

sub identifier {
    my $str = shift;
    $str =~ m/\A[ \t\n\&,\0]\z/;
}

1;
