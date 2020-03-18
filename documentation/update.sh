#!/usr/bin/env sh

set -eu

TOKEN=$1

bap="bap.master"
ls -la
cd $bap
bap_commit=`git rev-parse --short HEAD`

ls doc

blog=blog

#TODO
git clone https://github.com/gitoleg/binaryanalysisplatform.github.io --no-checkout --single-branch --branch=master --depth=1 $blog

mkdir -p $blog/bap/api

mv doc/man1 $blog/bap/api/
mv doc/man3 $blog/bap/api/
mv doc/lisp $blog/bap/api/
mv doc/odoc $blog/bap/api/

cd $blog

repo="https://${GITHUB_ACTOR}:${TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git config --global user.name $GITHUB_ACTOR
git config --global user.email "action-noreply@github.com"

git add bap/api

git commit -m $bap_commit
#  git push $repo master # TODO!
git push $repo add-actions
