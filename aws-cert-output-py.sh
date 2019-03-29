#!/bin/sh
#!/usr/bin/env python2
aws configure set region us-east-1 --profile sandbox
echo $aws_access_key_id
aws configure set aws_access_key_id $aws_access_key_id  --profile sandbox
aws configure set aws_secret_access_key $aws_secret_access_key --profile sandbox
echo "first step" > newfile.txt
echo "List of Certificates for Sanbox that are going to expire is as follows." >> newfile.txt
echo "=================================================================" >> newfile.txt
echo "" >> newfile.txt
export AWS_PROFILE=$Envi; python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> newfile.txt

#aws configure set region us-east-1 --profile nonprod
#aws configure set aws_access_key_id $access-key-id-non  --profile nonprod
#aws configure set aws_secret_access_key $secret-access-key-non --profile nonprod
#echo "Second step" >> newfile.txt
#echo "List of Certificates for Non-Prod that are going to expire is as follows." >> newfile.txt
#echo "=================================================================" >> newfile.txt
#echo "" >> newfile.txt
#export AWS_PROFILE=$envi-non; python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> newfile.txt >> newfile.txt

#aws configure set region us-east-1 --profile prod
#echo "Third step" >> newfile.txt
#echo "List of Certificates for Prod that are going to expire is as follows." >> newfile.txt
#echo "=================================================================" >> newfile.txt
#echo "" >> newfile.txt
#python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> newfile.txt


cat newfile.txt