#!/bin/sh
#!/usr/bin/env python2

echo "List of Certificates for $Envi that are going to expire is as follows." > confluence
echo "=================================================================" >> confluence
echo "">> confluence
python bit-bucket/pcf_automation/aws-checker/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> confluence
awk '{print $0"<br></br>"}' confluence > msg
value="$(cat msg)"
version=$(curl -u $Username:$Password $url | python -mjson.tool| grep number| awk {'print $2'}|tr "," " ");echo $version;version=$((version+1));echo $version
jq -n --arg id "$id" --arg key "$key" --arg value "$value" --arg version "$version" --arg  url "$url" '{"id": $id, "type":"page","url":$url,"title":"AWS Certificates","space":{"key": $key },"body":{"storage":{"value": $value,"representation":"storage"}},"version":{"number": $version }}' > con.json
curl -u "$Username":"$Password" -X PUT -H 'Content-Type: application/json' -d  @con.json $url |python -mjson.tool
