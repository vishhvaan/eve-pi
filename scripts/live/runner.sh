#!/bin/bash
tmux new -s "mobidorunner" -d "/bin/bash"
tmux run-shell -t "mobidorunner:0" "master.py"
tmux attach -t "mobidorunner" -d
