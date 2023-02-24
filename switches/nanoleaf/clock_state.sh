#!/bin/bash
if ps -ef | grep nanoleaf_clock > /dev/null
then
    echo "on"
else
	echo "off"
fi

