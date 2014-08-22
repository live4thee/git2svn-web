#!/bin/bash

set -e

# configure the SVN repo to fit your environment
SVN_REPO="$HOME/trunk"

test $# -eq 2 || exit 1

git_patch_file=$PWD/$1
svn_patch_dir=$PWD/$2

cd "$SVN_REPO"

svn up > /dev/null
svn patch "$git_patch_file"
svn diff > "$svn_patch_dir"
svn revert -R . > /dev/null
