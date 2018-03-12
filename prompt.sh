#!/bin/sh
PROTECTED_BRANCHES=(master develop)
# get current branch
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
PROMPT="you're about to $1 in $CURRENT_BRANCH branch. are you sure? (y/n): "
NO="$1 prevented.. you're welcome"
INVALID='invalid command! $1 prevented..'

# check if current branch is protected
if [[ " ${PROTECTED_BRANCHES[@]} " =~ " $CURRENT_BRANCH " ]]
then
  # allows user input
  exec < /dev/tty
  while true; do
    read -p "$PROMPT" command
    case "$command" in
      y|Y )
        # exit gracefully, proceed with git push command
        exit 0
        ;;
      n|N )
        echo $NO
        exit 1
        ;;
      * )
        echo $INVALID
        exit 1
        ;;
    esac
  done
fi
