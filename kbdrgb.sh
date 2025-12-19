kbdr() {
    local color_path="/sys/class/leds/rgb:kbd_backlight/multi_intensity"
    local brightness_path="/sys/class/leds/rgb:kbd_backlight/brightness"

    _usage() {
        echo "usage: kbdr -c R G B"
        echo "       kbdr -b brightness"
        echo "examples:"
        echo "       kbdr -c 255 0 255"
        echo "       kbdr -b 155"
    }

    _is_num() {
        [[ "$1" =~ ^[0-9]+$ ]] && (( $1 >= 0 && $1 <= 255 ))
    }

    if (( $# == 0 )); then
        _usage
        return 1
    fi

    case "$1" in
        -c)
            if (( $# != 4 )); then
                echo "Error: -c requires exactly three arguments (R G B)" >&2
                _usage
                return 1
            fi
            for val in "$2" "$3" "$4"; do
                _is_num "$val" || { echo "Error: R/G/B must be integers 0–255" >&2; return 1; }
            done
            printf "%d %d %d\n" "$2" "$3" "$4" | sudo tee "$color_path" >/dev/null
            ;;
        -b)
            if (( $# != 2 )); then
                echo "Error: -b requires exactly one argument (brightness)" >&2
                _usage
                return 1
            fi
            if ! _is_num "$2"; then
                echo "Error: brightness must be an integer 0–255" >&2
                return 1
            fi
            echo "$2" | sudo tee "$brightness_path" >/dev/null
            ;;
        *)
            _usage
            return 1
            ;;
    esac
}
