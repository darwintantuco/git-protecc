# git-protecc
Custom `pre-commit` and `pre-push` git hooks to prompt user when pushing/committing to master/develop

## Setup
1. Execute:
```
git clone https://github.com/dcrtantuco/git-protecc.git ~/.git-protecc

chmod 777 ~/.git-protecc/git-protecc
```

2. Update PATH in startup files (.bash_profile, .zsh, etc.)
```
export PATH=$PATH:/$HOME/.git-protecc
```

## Usage
Execute on any git repository to copy `pre-commit` and `pre-push` hooks
```
git-protecc
```
