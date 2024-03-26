if test -z "$XDG_RUNTIME_DIR"; then
    export XDG_RUNTIME_DIR=$(mktemp -d /tmp/$(id -u)-runtime-dir.XXX)
fi

if [ -z "${WAYLAND_DISPLAY}" ]; then
    dbus-run-session Hyprland
fi
