#!/bin/bash
#!/usr/bin/env python2

aws configure set region us-east-1 --profile prod
aws configure set aws_access_key_id $accessprod  --profile prod
aws configure set aws_secret_access_key $secretprod --profile prod
echo "List of Certificates for PROD that are going to expire is as follows." >> newfile.txt
echo "=================================================================" >> newfile.txt
echo "" >> newfile.txt
export AWS_PROFILE=prod; python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> newfile.txt >> newfile.txt
if [[ $? -ne 0 ]]
then
    echo "Error Running python script"
    exit 1
fi

aws configure set region us-east-1 --profile Nonprod
aws configure set aws_access_key_id $access  --profile Nonprod
aws configure set aws_secret_access_key $secret --profile Nonprod
echo "List of Certificates for NON-PROD that are going to expire is as follows." >> newfile.txt
echo "=================================================================" >> newfile.txt
echo "" >> newfile.txt
export AWS_PROFILE=Nonprod; python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> newfile.txt >> newfile.txt
if [[ $? -ne 0 ]]
then
    echo "Error Running python script"
    exit 1
fi

unset AWS_PROFILE
echo "List of Certificates for SANDBOX that are going to expire is as follows." >> newfile.txt
echo "=================================================================" >> newfile.txt
echo "" >> newfile.txt
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> newfile.txt
if [[ $? -ne 0 ]]
then
    echo "Error Running python script"
    exit 1
fi

cat newfile.txt

awk '{print $0"<br></br>"}' newfile.txt > msg
value="$(cat msg)"
version=$(curl -u $Username:$Password $url | python -mjson.tool| grep number| awk {'print $2'}|tr "," " ");echo $version;version=$((version+1));echo $version
jq -n --arg id "$id" --arg key "$key" --arg value "$value" --arg version "$version" --arg  url "$url" '{"id": $id, "type":"page","url":$url,"title":"AWS Certificates","space":{"key": $key },"body":{"storage":{"value": $value,"representation":"storage"}},"version":{"number": $version }}' > con.json
curl -u "$Username":"$Password" -X PUT -H 'Content-Type: application/json' -d  @con.json $url |python -mjson.tool