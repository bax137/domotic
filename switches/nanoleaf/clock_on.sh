#!/bin/bash
if launchctl list | grep org.ibax.nanoleaf_clock
then
    echo "clock already running"
	launchctl unload /Users/herve/Library/LaunchAgents/org.ibax.nanoleaf_clock.plist
	launchctl load /Users/herve/Library/LaunchAgents/org.ibax.nanoleaf_clock.plist
else
	launchctl load /Users/herve/Library/LaunchAgents/org.ibax.nanoleaf_clock.plist
	echo "clock started"
fi

