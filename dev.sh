#!/usr/bin/env bash

set -o errexit

rm -rf _site/

bundle exec jekyll serve -o --drafts --incremental --livereload
