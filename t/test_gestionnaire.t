#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use File::Temp qw[tempdir];
use File::Spec;
use Test::More tests => 2;
use Test::Deep;

my $tempdir = tempdir(CLEANUP => 1);
my $a = "$tempdir/gest/roots/a";
my $b = "$tempdir/gest/roots/b";
my $conf = "$tempdir/gest/roots/conf";

system('mkdir', '-p', $a);
system('mkdir', '-p', $b);
system('mkdir', '-p', $conf);

my $config_file = <<EOF;
[GEST]
roots = $a,$b
EOF

my $config_path = File::Spec->catfile($conf, 'conf');

do {
    open my $fh, '>', $config_path;
    print { $fh } $config_file;
};

is((-f $config_path), 1, 'config file exists');
is(0 + `cat $config_path | wc -l`, 2, 'config file has 2 lines');


