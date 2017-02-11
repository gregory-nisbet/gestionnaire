#!/bin/sh

set -e

for pm in lib/Gestionnaire/*; do
    echo "$pm"
    2>&1 perl -Ilib -c "$pm" | awk '{print "    " $0}'
done

for pm in lib/Gestionnaire/*; do
    echo "$pm"
    2>&1 perlcritic --brutal "$pm" | grep -v -F '$VERSION' | awk '{print "    " $0}'
done
