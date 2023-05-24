#!/bin/bash
sky_cuisine_auth="ZGV2OmQ3MWFjODc0MDE0MDg4Yjg5MzNlNDQ3MzI4MjlhZDE1NmM4MDIyZjlmZmM5MmYyMTA0YTlkZmU5NzhlMTNkMTc="
sky_cuisine_ip="192.168.1.201"
sky_sejour_auth="ZGV2OmI2ZTNlNTExOGI1YTk4ZjQ3NDllZDBjNTQ1OWVkZTFhODdiZTQ1YTM3MGMzMjAyODViMjg4ZmE5Y2VkZjM1YmI="
sky_sejour_ip="192.168.1.200"
auth="Authorization: Basic "

if [ "$#" -ne 7 ]; then
    echo "Number of arguments must be 7"
    exit 1
else
    device=$1
    if [[ "$device" == "sky_sejour" ]]; then
        auth=$auth$sky_sejour_auth
        ip=$sky_sejour_ip
    elif [[ "$device" == "sky_cuisine" ]]; then
        auth=$auth$sky_cuisine_auth
        ip=$sky_cuisine_ip
    else
        echo "Device must be sky_sejour|sky_cuisine"
        exit 1
    fi

    cycle=$2

    priority=$3
    if [[ !("$priority" =~ ^(info|warning|critical)$) ]]; then
        echo "Priority must be info|warning|critical"
        exit 1
    fi

    icon_type=$4
    if [[ !("$icon_type" =~ ^(none|info|alert)$) ]]; then
        echo "Priority must be none|info|alert"
        exit 1
    fi

    icon_id=$5
    lifetime=$6
    text=$7

    curl --location "http://$ip:8080/api/v2/device/notifications" \
            --header 'Content-Type: application/json' \
            --header "$auth" \
            --data "{
                \"priority\": \"$priority\",
                \"icon_type\": \"$icon_type\",
                \"lifetime\": $lifetime,
                \"model\": {
                    \"cycles\": $cycle,
                    \"frames\": [
                    {
                        \"icon\": \"$icon_id\",
                        \"text\": \"HELLO!\"
                    }
                    ]
                }
            }"
fi