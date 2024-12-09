# Set SESSION_NAME based on the name of the script sourcing this library
if [ -z "$SESSION_NAME" ]; then
    SESSION_NAME="$(basename "$(realpath "$BASH_SOURCE")" .sh)"
fi

# Attach to / Create the new Tmux session, with a given window name
tmux_new() {
    tmux new-session -A -d -s $SESSION_NAME -n $1
}

# Create a new Tmux window with a given index and name
tmux_neww() {
    tmux new-window -t $SESSION_NAME:$1 -n "$2"
}

# Attach to the Tmux session
tmux_attach() {
    tmux attach -t $SESSION_NAME
}

# Send a command to the Tmux window
tmux_send() {
    tmux send-keys -t $SESSION_NAME:$1 "${@:2}"
}
