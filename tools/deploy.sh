#!/bin/bash
#
# Deploy the content of _site to 'origin/<pages_branch>'
#
# v2.5
# https://github.com/cotes2020/jekyll-theme-chirpy
# © 2020 Cotes Chung
# Published under MIT License

set -eu

PAGES_BRANCH="gh-pages"

_no_branch=false
_backup_dir="$(mktemp -d)"

init() {
  if [[ -z $(git branch -av | grep "$PAGES_BRANCH") ]]; then
    _no_branch=true
    git checkout -b "$PAGES_BRANCH"
  else
    git checkout "$PAGES_BRANCH"
  fi
}

backup() {
  mv _site/* "$_backup_dir"
  mv .git "$_backup_dir"

  # When adding custom domain from Github website,
  # the CANME only exist on `gh-pages` branch
  if [[ -f CNAME ]]; then
    mv CNAME "$_backup_dir"
  fi
}

flush() {
  rm -rf ./*
  rm -rf .[^.] .??*

  shopt -s dotglob nullglob
  mv "$_backup_dir"/* .
}

deploy() {
  git config --global user.name "GitHub Actions"
  git config --global user.email "49792282+github-actions[bot]@users.noreply.github.com"

  git update-ref -d HEAD
  git add -A
  git commit -m "[Automation] Site update No.${GITHUB_RUN_NUMBER}"

  if $_no_branch; then
    git push -u origin "$PAGES_BRANCH"
  else
    git push -f
  fi
}

main() {
  init
  backup
  flush
  deploy
}

main
