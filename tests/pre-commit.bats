#!./tests/libs/bats/bin/bats

setup() {
  mkdir AWESOME
  cd AWESOME
  git init
  echo AWESOME TEXT > awesome.txt
  git add awesome.txt
  git commit -m "Initial commit"
  cp ../protecc.sh .git/hooks/
  cp ../pre-commit .git/hooks/
  cp ../pre-push .git/hooks/
}

teardown() {
  cd ..
  rm -rf AWESOME
}

@test "Normal commit with pre-commit hook" {
  echo MORE AWESOME TEXT > awesome.txt
  git add awesome.txt
  git commit -m "Add more awesome text"
}
