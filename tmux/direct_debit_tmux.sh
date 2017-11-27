#!/bin/zsh
tmux new-session -d -s 'kpdd_dev_session' -n dev_env -c ~/Workspace/KLARNA_DIRECT_DEBIT_PAYMENT/direct-debit 
tmux new-window -d -n KPD -c ~/Workspace/KLARNA_DIRECT_DEBIT_PAYMENT/direct-debit
tmux new-window -d -n KPA -c ~/Workspace/KLARNA_DIRECT_DEBIT_PAYMENT/klarna-payments-app 
tmux new-window -d -n KPL -c ~/Workspace/KLARNA_DIRECT_DEBIT_PAYMENT/klarna-payments-lib
tmux new-window -d -n KPP -c ~/Workspace/KLARNA_DIRECT_DEBIT_PAYMENT/klarna-payments-dev-proxy
tmux -2 attach-session -d
