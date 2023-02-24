#!/bin/bash
if launchctl list | grep org.ibax.nanoleaf_clock
then
	launchctl unload /Users/herve/Library/LaunchAgents/org.ibax.nanoleaf_clock.plist
	python3 /Users/herve/scripts/nanoleaf/nanoleaf_off.py
	echo "clock stopped"
else
	echo "clock not running"
fi