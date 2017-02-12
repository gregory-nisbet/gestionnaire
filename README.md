# gestionnaire

a simple file-oriented package manager

Gestionnaire is intended to be a simple package manager in the spirit of `installpkg` and related tools on Slackware Linux.

Slackware's package management strategy is really simple. The user creates a tar archive. Paths inside the archive are interpreted relative to the root of the filesystem, except for the `install` directory, which contains stuff like postinstallation scripts. The permissions and owners of the group are preserved in a Slackware package.

Gestionnaire is intended to support two modes of operation: a file-oriented mode where individual files are moved into place and associated with a package name and an archive mode where an entire collection of files is associated with a package at once, totally wiping out whatever was there before.

1) file-oriented
    
    gest add-file [pkgname] [src] [dest] [owner] [group] [permissions]
    
2) archive

    gest add-pkg archive

In both modes of operation, Gestionnaire will be picky and reject any operation that

1) writes to a path that is not explicitly managed by gestionnaire
1) writes to a path that is not associated with the package name in question

Gestionnaire will completely ignore all metadata in the archive or on files such as the timestamp, permissions, owner, etc. 

Allowances.

Gestionnaire has two notions of allowances:

Global allowances apply to all packages that Gestionnaire manages

Per-package allowances apply to individual packages ... however, no

there are separate notions of config and data files ... to faciliate managing backups of configuration information, as well as wiping out data.
