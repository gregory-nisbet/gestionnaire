package Gestionnaire::Gest;
use strict;
use warnings;
use File::Copy;
use Config::IniFiles;


# make_gest
#    roots
#    schema
#    pkg_state
#    staging_area (optional)
#    backups (optional)
sub make_gest {
    my ($cls, %args) = @_;
    my $o = {};

    # all the paths that gest can use
    $o->{roots} = $args{roots};

    # package schema directories
    $o->{schema} = $args{schema};
    
    # package state directories
    $o->{pkg_state} = $args{pkg_state};

    bless $o, $cls;
    return $o;
}
