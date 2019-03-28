#!/bin/bash
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