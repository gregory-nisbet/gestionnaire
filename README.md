# gestionnaire

a simple file-oriented package manager

Gestionnaire is intended to be a simple package manager in the spirit of `installpkg` and related tools on Slackware Linux.

Slackware's package management strategy is really simple. The user creates a tar archive. Paths inside the archive are interpreted relative to the root of the filesystem, except for the `install` directory, which contains stuff like postinstallation scripts. The permissions and owners of the group are preserved in a Slackware package.

Gestionnaire, by constrast, is intended to have two modes of operation:

1) file-oriented
    
    gest add-file [pkgname] [src] [dest] [owner] [group] [permissions]
    
2) archive

    gest add-pkg archive
    
Gestionnaire will completely ignore all metadata in the archive such as the timestamp, permissions, owner, etc. 
