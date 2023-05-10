#!/usr/bin/env bash

set -o errexit

rm -rf _site/

rvm use ruby-2.7.5
rvm gemset create mdjnewman.github.io
bundle install

bundle exec jekyll serve -o --drafts --incremental --livereload
