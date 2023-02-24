#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Argument: group id is missing"
else
    curl -s --location --request PUT "http://192.168.1.100/api/UyUyQ0wu3TRdWKOC4SDK7VCum3O8LEOMpiQahvGF/groups/$1" \
                        --header 'Content-Type: application/json' \
                        --data-raw '{
                            "stream": {
                                "active": false
                            }
                        }' \
            > /dev/null
    echo "entertainment stopped on group $1"
fi