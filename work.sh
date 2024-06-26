#! /bin/sh
session=ansible
workspace=$HOME/w/marco-souza/ansible-playbooks

# kill session
if [ "$1" = "k" ]; then
  echo "Kill session"
  tmux kill-session -t $session
  exit 0
fi

echo "Creating workspace..."

# setup windows
tmux new \
  -s $session -n $session \
  -c $workspace -d \
  nvim

