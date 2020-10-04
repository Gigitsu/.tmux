#!/bin/bash

function get_battery_info() {
    case "${OSTYPE}" in
        linux*)
            echo $(acpi | cut -d ',' -f 2)
            ;;
        darwin*)
            echo $(pmset -g batt | grep -oE "[0-9]+%")
            ;;
        *)
            echo "No battery info" >&2
            return 1
            ;;
    esac
}

get_battery_info