# git-protecc

[![Build Status](https://travis-ci.org/dcrtantuco/git-protecc.svg?branch=master)](https://travis-ci.org/dcrtantuco/git-protecc)

Custom `pre-push` git hooks to prompt user when pushing to protected branches

`git config` is used to set protected branches

Backup existing `pre-push` hook

![sample](demo.gif)

## Getting Started

### Requirements

npm >= 5.2.0

## Usage

#### Add branch to protected branches

```
npx git-protecc branch add <branch-1> <branch-2>
```

#### Remove branch from protected branches

```
npx git-protecc branch remove <branch-1> <branch-2>
```

#### List all protected branches

```
npx git-protecc branch
```

## License

MIT
