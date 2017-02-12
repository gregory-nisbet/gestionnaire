#!/bin/sh

set -e

echo "syntax"

for pm in lib/Gestionnaire/*; do
    echo "  $pm"
    2>&1 perl -Ilib -c "$pm" | awk '{print "    " $0}'
done
echo

echo "style"

for pm in lib/Gestionnaire/*; do
    echo "  $pm"
    2>&1 perlcritic --brutal "$pm" | grep -v -F '$VERSION' | awk '{print "    " $0}'
done
echo

echo "tests"

for t in t/*; do
    echo "  $t"
    2>&1 prove -Ilib "$t" | awk '{print "    " $0}'
done
