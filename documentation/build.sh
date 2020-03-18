#!/usr/bin/env sh

set -eu


eval $(opam env)


bap="bap.master"

git clone https://github.com/BinaryAnalysisPlatform/bap --single-branch --branch=master --depth=1 $bap
cd $bap
bap_commit=`git rev-parse --short HEAD`

make doc

ls doc
echo "build doc over"
