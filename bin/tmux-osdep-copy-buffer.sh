#!/bin/sh

#  Use an OS-dependent method to place the contents of the current
#  tmux paste buffer into the "system clipboard".

#exec 2>&1 # helpful for capturing stderr while debugging

n=${0##*/}

die() {
        # If this was run via run-shell, stdout will be captured and
        # displayed in a temporary copy-mode in the current pane.
        printf "$n"': %s\n' "$*"
        exit 1
}

case "$(uname -s)" in
Darwin)
        # If reattach-to-user-namespace is not in your PATH, you may
        # set the RATUNS environment variable (e.g. before your start
        # your tmux server, or in your .tmux.conf file).
        case "$1" in
        copy)
                tmux save-buffer - | "${RATUNS:-reattach-to-user-namespace}" pbcopy ||
                        die 'unable to use pbcopy'
                ;;
        paste)
                tmux set-buffer $(reattach-to-user-namespace pbpaste)
        tmux paste-buffer
                ;;
        *)
                die 'unknown command: must be copy or paste'
                ;;
        esac
        ;;
Linux|*BSD|SunOS)
        # Check for DISPLAY and xsel/xclip, and use them (or whatever is appropriate).
        case "$1" in
        copy)
                tmux save-buffer - | xclip -i -sel clipboard
                ;;
        paste)
                tmux set-buffer "$(xclip -o -sel clipboard)"; tmux paste-buffer
                ;;
        *)
                die 'unknown command: must be copy or paste'
        esac
        ;;
*)
        die 'unknown platform'
        ;;
esac

