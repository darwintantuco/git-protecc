#!/usr/bin/env bats

load '../node_modules/bats-support/load'
load '../node_modules/bats-assert/load'

setup() {
  mkdir AWESOME
  cd AWESOME
  git init
  echo AWESOME TEXT > awesome.txt
  git add awesome.txt
  git commit -m "Initial commit"
  cp ../protecc.sh .git/hooks/
  cp ../pre-commit .git/hooks/
  echo MORE AWESOME TEXT > awesome.txt
  git add awesome.txt
}

teardown() {
  cd ..
  rm -rf AWESOME
}

@test 'Commit to master with "Y" response' {
  # Hacks: send reply [Yn]
  echo Y > REPLY-TEST.txt
  run git commit -m "Add more awesome text"
  [ "$status" -eq 0 ]
}

@test 'Commit to master with "n" response' {
  echo n > REPLY-TEST.txt
  run git commit -m "Add more awesome text"
  [ "$status" -eq 1 ]
  [ "$output" = "git commit is not executed." ]
}

@test 'Commit to master with "invalid" response' {
  echo invalid > REPLY-TEST.txt
  run git commit -m "Add more awesome text"
  [ "$status" -eq 1 ]
  [ "$output" = "Invalid command! git commit is not executed." ]
}

@test 'Commit to non-protected branch' {
  git checkout -b feature/branch-1
  echo "" > REPLY-TEST.txt
  run git commit -m "Add more awesome text"
  [ "$status" -eq 0 ]
}
