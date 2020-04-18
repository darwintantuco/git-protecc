# git-protecc

![Node.js CI](https://github.com/darwintantuco/git-protecc/workflows/Node.js%20CI/badge.svg)

Custom `pre-push` git hooks to prompt user when pushing to protected branches

`git config` is used to set protected branches

Backup existing `pre-push` hook

![sample](demo.gif)

## Getting Started

### Requirements

npm >= 5.2.0

bash

## Usage

#### List all protected branches

```bash
$ npx git-protecc branch
```

#### Add branch to protected branches

```bash
$ npx git-protecc branch add <branch>
```

#### Remove branch from protected branches

```bash
$ npx git-protecc branch remove <branch>
```

## License

MIT
