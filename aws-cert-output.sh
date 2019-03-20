awk '{print $0"<br></br>"}' confluence > msg
value="$(cat msg)"
version=$(curl -u $Username:$Password $url | python -mjson.tool| grep number| awk {'print $2'}|tr "," " ");echo $version;version=$((version+1));echo $version
jq -n --arg id "$id" --arg key "$key" --arg value "$value" --arg version "$version" --arg  url "$url" '{"id": $id, "type":"page","url":$url,"title":"AWS Certificates","space":{"key": $key },"body":{"storage":{"value": $value,"representation":"storage"}},"version":{"number": $version }}' > con.json
curl -u "$Username":"$Password" -X PUT -H 'Content-Type: application/json' -d  @con.json $url |python -mjson.tool
