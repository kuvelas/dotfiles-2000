#!/bin/env sh

pkill polybar

sleep 1;

for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar mkpolybar &
done
