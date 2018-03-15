#!./tests/libs/bats/bin/bats

setup() {
  mkdir RANDOM_GIT_REPO
}

teardown() {
  cd ..
  rm -rf RANDOM_GIT_REPO
}

@test "Normal commit" {
  cd RANDOM_GIT_REPO
  git init
  echo RANDOM TEXT > sample.txt
  git add sample.txt
  git commit -m "Initial commit"
}

@test "Normal commit with pre-commit hook" {
  cd RANDOM_GIT_REPO
  git init
  echo RANDOM TEXT > sample.txt
  git add sample.txt
  git commit -m "Initial commit"

  cp ../protecc.sh .git/hooks/
  cp ../pre-commit .git/hooks/

  # echo UPDATE TEXT > sample.txt
  # git add sample.txt
  # git commit -m "Update sample"
}
