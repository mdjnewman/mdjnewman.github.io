#!/usr/bin/env bash

set -o errexit

rm -rf _site/

npx livereload _site/ &
bundle exec jekyll serve -o --drafts --incremental &

wait