#!/usr/bin/env bats

load '../node_modules/bats-support/load'
load '../node_modules/bats-assert/load'

AWESOME_REMOTE=$(mktemp -d)
AWESOME_REPO=$(mktemp -d)
BASE_DIR=$(dirname $BATS_TEST_DIRNAME)
REPLY="REPLY-TEST.txt"

setup() {
  # local git remote origin
  git init --bare $AWESOME_REMOTE/backup.git

  cd $AWESOME_REPO
  git init

  echo "AWESOME TEXT" > awesome.txt
  git add awesome.txt
  git commit -m "Initial commit"
  git remote add origin $AWESOME_REMOTE/backup.git

  run $BASE_DIR/bin/git-protecc branch add master

  echo MORE AWESOME TEXT > awesome.txt
  git add awesome.txt

  assert [ -e $AWESOME_REPO/.git/hooks/pre-push ]
}

teardown() {
  echo "Deleting $AWESOME_REPO"
  rm -rf $AWESOME_REPO

  echo "Deleting $AWESOME_REMOTE"
  rm -rf $AWESOME_REMOTE
}

@test 'git push to master with "Y" response' {
  echo "Y" > $REPLY
  run git commit -m "Add more awesome text"

  run git push origin master

  assert_success
}

@test 'git push to master with "n" response' {
  echo "n" > $REPLY
  run git commit -m "Add more awesome text"

  run git push origin master

  assert_failure
  assert_line --partial "git push is not executed."
}

@test 'git push to master with "invalid" response' {
  echo "invalid" > $REPLY
  run git commit -m "Add more awesome text"

  run git push origin master

  assert_failure
  assert_line --partial "Invalid command. git push is not executed."
}

@test 'git push to non-protected branch' {
  git checkout -b feature/branch-1
  run git commit -m "Add more awesome text"

  run git push origin master

  assert_success
}
