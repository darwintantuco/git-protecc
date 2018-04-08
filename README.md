# git-protecc
[![Build Status](https://travis-ci.org/dcrtantuco/git-protecc.svg?branch=master)](https://travis-ci.org/dcrtantuco/git-protecc)

Custom `pre-commit` and `pre-push` git hooks to prompt user when pushing/committing to master/develop

![sample](demo.gif)

## Installation
### npm
```
npm install -g git-protecc
```

## Usage
Execute on a git repository _(should be in root for now, where .git is located)_
```
git-protecc
```
This command copies custom `pre-commit` and `pre-push` hooks to current repository

## Protected Branches
- master
- develop
