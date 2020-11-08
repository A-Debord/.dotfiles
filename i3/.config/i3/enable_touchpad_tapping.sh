# sometimes the dev number is not the same..

dev=$(xinput | grep Touchpad | sed 's/^.*id=\([0-9]\+\).*$/\1/g')
option=$(xinput list-props $dev | grep "Tapping Enabled (" | sed 's/^.*(\([0-9]\+\)).*$/\1/g')
xinput set-prop $dev $option 1