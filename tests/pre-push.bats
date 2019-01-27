#!/usr/bin/env bats

load '../node_modules/bats-support/load'
load '../node_modules/bats-assert/load'

AWESOME_REMOTE=$(mktemp -d)
AWESOME_REPO=$(mktemp -d)
BASE_DIR=$(dirname $BATS_TEST_DIRNAME)
REPLY="REPLY-TEST.txt"

setup() {
  git init --bare $AWESOME_REMOTE/backup.git
  cd $AWESOME_REPO
  git init
  echo "AWESOME TEXT" > awesome.txt
  git add awesome.txt
  git commit -m "Initial commit"
  git remote add origin $AWESOME_REMOTE/backup.git

  # run ./git-protecc
  # cp $BASE_DIR/protecc.sh $AWESOME_REPO/.git/hooks/
  cp $BASE_DIR/pre-push $AWESOME_REPO/.git/hooks/
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

@test 'Commit to master with "Y" response' {
  echo "Y" > $REPLY
  run git commit -m "Add more awesome text"
  run git push origin master
  assert_success
}

@test 'Push to master with "n" response' {
  echo "n" > $REPLY
  run git commit -m "Add more awesome text"
  run git push origin master
  assert_failure
  assert_line --partial "git push is not executed."
}

@test 'Push to master with "invalid" response' {
  echo "invalid" > $REPLY
  run git commit -m "Add more awesome text"
  run git push origin master
  assert_failure
  assert_line --partial "Invalid command! git push is not executed."
}

@test 'Push to non-protected branch' {
  git checkout -b feature/branch-1
  run git commit -m "Add more awesome text"
  run git push origin master
  assert_success
}
