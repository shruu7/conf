#!/bin/sh
#!/usr/bin/env python2

echo "first step" > newfile.txt
echo "List of Certificates for Sanbox that are going to expire is as follows." >> newfile.txt
echo "=================================================================" >> newfile.txt
echo "" >> newfile.txt
var=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)
echo $var >> newfile.txt

echo "Second step" >> newfile.txt
echo "List of Certificates for Non-Prod that are going to expire is as follows." >> newfile.txt
echo "=================================================================" >> newfile.txt
echo "" >> newfile.txt
var1=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)
echo $var1 >> newfile.txt
   
echo "Third step" >> newfile.txt
echo "List of Certificates for Prod that are going to expire is as follows." >> newfile.txt
echo "=================================================================" >> newfile.txt
echo "" >> newfile.txt
var2=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)
echo $var2 >> newfile.txt


cat newfile.txt

awk '{print $0"<br></br>"}' newfile.txt > msg
value="$(cat msg)"
version=$(curl -u $Username:$Password $url | python -mjson.tool| grep number| awk {'print $2'}|tr "," " ");echo $version;version=$((version+1));echo $version
jq -n --arg id "$id" --arg key "$key" --arg value "$value" --arg version "$version" --arg  url "$url" '{"id": $id, "type":"page","url":$url,"title":"AWS Certificates","space":{"key": $key },"body":{"storage":{"value": $value,"representation":"storage"}},"version":{"number": $version }}' > con.json
curl -u "$Username":"$Password" -X PUT -H 'Content-Type: application/json' -d  @con.json $url |python -mjson.tool