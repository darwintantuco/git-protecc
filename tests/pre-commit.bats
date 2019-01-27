#!/usr/bin/env bats

load '../node_modules/bats-support/load'
load '../node_modules/bats-assert/load'

AWESOME_REPO=$(mktemp -d)
BASE_DIR=$(dirname $BATS_TEST_DIRNAME)
RESP_FILE="RESP_FILE.txt"

setup() {
  cd $AWESOME_REPO
  git init
  echo "AWESOME TEXT" > awesome.txt
  git add awesome.txt
  git commit -m "Initial commit"

  # run $BASE_DIR/bin/git-protecc
  cp $BASE_DIR/protecc.sh .git/hooks/
  cp $BASE_DIR/pre-commit .git/hooks/
  echo MORE AWESOME TEXT > awesome.txt
  git add awesome.txt

  assert [ -e $AWESOME_REPO/.git/hooks/pre-commit ]
}

teardown() {
  echo "Deleting $AWESOME_REPO."
  rm -rf $AWESOME_REPO
}

@test 'Commit to master with "Y" response' {
  # Hacks: send reply [Yn]
  echo Y > REPLY-TEST.txt
  run git commit -m "Add more awesome text"
  assert_success
}

@test 'Commit to master with "n" response' {
  echo n > REPLY-TEST.txt
  run git commit -m "Add more awesome text"
  assert_failure
  assert_line --partial "git commit is not executed."
}

@test 'Commit to master with "invalid" response' {
  echo invalid > REPLY-TEST.txt
  run git commit -m "Add more awesome text"
  assert_failure
  assert_line --partial "Invalid command! git commit is not executed."
}

@test 'Commit to non-protected branch' {
  git checkout -b feature/branch-1
  echo "" > REPLY-TEST.txt
  run git commit -m "Add more awesome text"
  assert_success
}
