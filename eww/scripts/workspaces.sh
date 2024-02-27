#!/bin/sh

workspaces() {
    hyprctl workspaces -j | jq -c 'map({id: .id, windows: .windows}) | sort_by(.id)[]'
}

active() {
    hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id'
}

output() {
    for workspace in $(workspaces); do
        workspace_id=$(echo "$workspace" | jq -r '.id')

        echo "(eventbox :class 'workspace' :onclick 'hyprctl dispatch workspace $workspace_id' (label :text '$workspace_id' :class '$([ "$workspace_id" = "$(active)" ] && echo 'currentWorkspace' || echo '')'))"
    done
}

echo $(output)
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    echo $(output)
done
