set -gx EDITOR "/snap/bin/nvim"
set -gx PATH "/home/adel/.config/tmux/plugins/tmuxifier/bin" $PATH

# if not set -q TMUX
#     set -g TMUX tmux new-session -d -s base
#     eval $TMUX
#     tmux attach-session -d -t base
# end

fish_add_path /bin/.local/scripts/
eval (tmuxifier init - fish)
