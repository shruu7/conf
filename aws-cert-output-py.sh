#!/bin/sh
#!/usr/bin/env python2
#aws configure set region us-east-1 --profile sandbox
#aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID --profile sandbox
#aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY --profile sandbox
echo "first step" > newfile.txt
echo "List of Certificates for Sandbox that are going to expire is as follows." >> newfile.txt
echo "=================================================================" >> newfile.txt
echo "" >> newfile.txt
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> newfile.txt

aws configure set region us-east-1 --profile Nonprod
aws configure set aws_access_key_id $access  --profile Nonprod
aws configure set aws_secret_access_key $secret --profile Nonprod
echo "Second step" >> newfile.txt
echo "List of Certificates for Non-Prod that are going to expire is as follows." >> newfile.txt
echo "=================================================================" >> newfile.txt
echo "" >> newfile.txt
export AWS_PROFILE=Nonprod; python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> newfile.txt >> newfile.txt

aws configure set region us-east-1 --profile prod
aws configure set aws_access_key_id $accessprod  --profile prod
aws configure set aws_secret_access_key $secretprod --profile sandbox
echo "Third step" >> newfile.txt
echo "List of Certificates for Prod that are going to expire is as follows." >> newfile.txt
echo "=================================================================" >> newfile.txt
echo "" >> newfile.txt
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> newfile.txt
export AWS_PROFILE=prod; python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> newfile.txt >> newfile.txt
cat newfile.txt