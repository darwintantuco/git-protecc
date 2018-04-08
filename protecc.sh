#!/usr/bin/env sh
PROTECTED_BRANCHES=(master develop)
# Get current branch
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
PROMPT="You're about to $1 in $CURRENT_BRANCH branch. Are you sure? [Yn]: "
NO="git $1 is not executed."
INVALID='Invalid command! git $1 is not executed.'

# Check if current branch is protected
if [[ " ${PROTECTED_BRANCHES[@]} " =~ " $CURRENT_BRANCH " ]]
then
  # Allows user input
  exec < /dev/tty
  while true; do
    read -p "$PROMPT" command
    case "$REPLY" in
      Y )
        # Exit gracefully, proceed with git commit/push
        exit 0
        ;;
      n )
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
