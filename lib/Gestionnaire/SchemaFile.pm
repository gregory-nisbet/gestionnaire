package Gestionnaire::SchemaFile;
use strict;
use warnings;


sub new {
    my ($cls, %args) = @_;
    my $o = {};

    my $name = $args{name};
    my $path = $args{path};

    $o->{name} = $name;
    $o->{path} = $path;

    bless $o, $cls;
    return $o;
}


sub valid_identifier {
    my ($path) = @_;
    return ($path =~ m/\A[^ \t\n:\&]\z/);
}


sub Get {
    my ($self, $key) = @_;
    die unless valid_identifier($key);

    open my $fh, '<', $self->{path} or die;

    my @out;

    while (<$fh>) {
        chomp;
        my $line = $_;
        my ($k, $v) = split /[ ]+/, $line;

        if ($k eq $key) {
            push @out, $v;
        }
    }

    return [@out];
}


1;
