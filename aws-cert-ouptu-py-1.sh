#!/bin/sh
#!/usr/bin/env python2

echo "List of Certificates for $Envi that are going to expire is as follows." 
echo "=================================================================" 
echo "" 
var1=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 2>&1)
echo "second step" >> newfile.txt
echo $var1 >> newfile.txt
echo "-------------"
cat newfile.txt
echo "-------------"