#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Argument: sensor id is missing"
else
    /usr/bin/curl -s --location --request GET "http://192.168.1.100/api/UyUyQ0wu3TRdWKOC4SDK7VCum3O8LEOMpiQahvGF/sensors/$1" | /usr/bin/jq '.config.on'
fi