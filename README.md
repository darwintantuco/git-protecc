# git-protecc
Custom `pre-commit` and `pre-push` git hooks to prompt user when pushing/committing to master/develop

## Protected Branches
- master
- develop

## Setup
1. Execute:
```
git clone https://github.com/dcrtantuco/git-protecc.git ~/.git-protecc
```

2. Make git-protecc executable
```
chmod +x ~/.git-protecc/git-protecc
```

3. Update PATH variable in startup files (.bash_profile, .zsh, etc.)

Makes git-protecc available globally
```
export PATH=$PATH:/$HOME/.git-protecc
```

## Usage
Execute on a git repository (root, where .git is located)

This command copies custom `pre-commit` and `pre-push` hooks to current repository
```
git-protecc
```

## TODO
```
# TODO add tests
# TODO add flags to enable either pre-commit or pre-push or both
# TODO add message if hooks exist / already copied
# TODO add error message if not executed in root / parent folder
# TODO backup the old hook file before copying?
```
