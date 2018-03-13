# git-protecc
[![Build Status](https://travis-ci.org/dcrtantuco/git-protecc.svg?branch=master)](https://travis-ci.org/dcrtantuco/git-protecc)

Custom `pre-commit` and `pre-push` git hooks to prompt user when pushing/committing to master/develop

## To Install
Execute
```
git clone https://github.com/dcrtantuco/git-protecc.git ~/.git-protecc && chmod +x ~/.git-protecc/git-protecc
```

Make git-protecc available globally by updating PATH variable in your startup file (.bash_profile, .zsh, etc.)
```
export PATH=$PATH:/$HOME/.git-protecc
```

## Usage
Execute on a git repository _(should be in root for now, where .git is located)_

This command copies custom `pre-commit` and `pre-push` hooks to current repository

```
git-protecc
```

## Protected Branches
- master
- develop

## TODO
```
# TODO add tests
# TODO add flags to enable either pre-commit or pre-push or both
# TODO add message if hooks exist / already copied
# TODO add error message if not executed in root / parent folder
# TODO backup the old hook file before copying?
```

