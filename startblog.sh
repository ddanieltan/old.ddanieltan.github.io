#!/bin/sh

# session name
session="blog"

# setup and connect to session if exists, otherwise create new session
tmux start-server
tmux new-session -d -A -s $session

# Pane 1: jupyter lab
tmux selectp -t 1
tmux send-keys "conda activate blog;jupyter lab" C-m

# Pane 2: make live site
tmux splitw -h -p 40 # % of screen pane 1 will take
tmux send-keys "conda activate blog;make live" C-m

# Start with cursor in Pane 1
tmux selectp -t 1
tmux attach-session -t $session
