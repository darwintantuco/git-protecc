# git-protecc

[![Build Status](https://travis-ci.org/dcrtantuco/git-protecc.svg?branch=master)](https://travis-ci.org/dcrtantuco/git-protecc)

Custom `pre-push` git hooks to prompt user when pushing to protected branches

`git config` is used to set protected branches

Backup existing `pre-push` hook

![sample](demo.gif)

## Installation

### npm

```
npm install -g git-protecc
```

## Usage

Execute `git-protecc` on a git repository

### Add branch to protected branches

```
git-protecc branch add <branch>
```

### List all protected branches

```
git-protecc branch
```

### Remove branch from protected branches

```
git-protecc branch remove <branch>
```

## License

MIT
