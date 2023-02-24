#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Argument: sensor id is missing"
else
    /usr/bin/curl --location --request PUT "http://192.168.1.100/api/UyUyQ0wu3TRdWKOC4SDK7VCum3O8LEOMpiQahvGF/sensors/$1/config" \
    --header 'Content-Type: application/json' \
    --data-raw '{
    "on":true
    }'
fi