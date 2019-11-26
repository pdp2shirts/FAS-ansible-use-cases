#!/usr/bin/env bash

set -x

echo "Building docs with Sphinx"
make clean
make html



#echo "Checking links"
#make linkcheck