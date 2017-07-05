#! /usr/bin/env bash

set -o pipefail
set -o errexit
set -o xtrace
set -o nounset
set -o noglob

ORIGIN_DIR=repo-origin
WORKING_DIR=repo

#
# Clean up and create 'origin'
#

rm -rf "$WORKING_DIR" "$ORIGIN_DIR"
mkdir "$ORIGIN_DIR"
pushd "$ORIGIN_DIR"

git init .

echo "Awesome feature 1" >> Features.txt
git add .
git commit -m "Awesome feature 1!"

echo "Awesome feature 2" >> Features.txt
git add .
git commit -m "Awesome feature 2!"

popd

#
# Create working copy and branch
#

git clone "$ORIGIN_DIR" "$WORKING_DIR"

pushd "$WORKING_DIR"

git checkout -b feature-5

popd

#
# Add some commits to origin, on master
#

pushd "$ORIGIN_DIR"

echo "Awesome feature 3" >> Features.txt
git add .
git commit -m "Awesome feature 3!"

echo "Awesome feature 4" >> Features.txt
git add .
git commit -m "Awesome feature 4!"

popd

#
# Do some work on feature-5
#

pushd "$WORKING_DIR"

git fetch origin master:master

echo "Awesome feature 5" >> Features.txt
git add .
git commit -m "Awesome feature 5!"

git push --set-upstream origin feature-5

git pull -r origin master || true

# ... fix merge conflicts
vim Features.txt
git add Features.txt
git rebase --continue

# ... checkout master and switch back to feature-5

git checkout master
git checkout feature-5

popd

#
# Rebase onto origin/feature-5
#

pushd "$WORKING_DIR"

git pull --rebase origin feature-5 || true
DONE=1

set +o errexit
while [ "$DONE" -ne "0" ]
do
    vim Features.txt && git add . && git rebase --continue
    DONE=$?
done
set -o errexit

popd
