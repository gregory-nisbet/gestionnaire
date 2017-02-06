#!/usr/bin/env perl
use strict;
use warnings;
use File::Temp qw[tempfile];
use Test::More tests => 3;
use Test::Deep;
use Gestionnaire::SchemaFile;


sub new_sf {
    my ($name) = @_;
    my ($fh, $filename) = tempfile();
    my $sf = Gestionnaire::SchemaFile->new(
        name => $name,
        path => $filename,
    );
    return ($fh, $filename, $sf);
}


do {
    my ($fh, $filename, $sf) = new_sf('nama');

    is($sf->{name}, 'nama', "recover name");
    is($sf->{path}, $filename, "recover path");
};


do {
    my ($fh, $filename, $sf) = new_sf('nama');

    print $fh 'k v';
    # if you don't have this, the test fails
    close $fh;

    cmp_deeply($sf->Get('k'), ['v'], "extract key");
};
