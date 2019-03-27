#!/bin/sh
#!/usr/bin/env python2

echo "List of Certificates for $Envi that are going to expire is as follows." 
echo "=================================================================" 
echo ""
var=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)
var1=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)
var2=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)
echo "first step" > newfile.txt
echo $var >> newfile.txt
echo "----second step-----" >> newfile.txt
echo $var1 >> newfile.txt
cat newfile.txt
