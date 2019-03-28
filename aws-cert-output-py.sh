#!/bin/bash
#!/usr/bin/env python2

var=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)
var1=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)
var2=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)

if [[ $Envi == "sandbox" ]];
then 
    echo "List of Certificates for $Envi that are going to expire is as follows." 
    echo "=================================================================" 
    echo ""
    echo "first step" > newfile.txt
    echo $var >> newfile.txt
elif [[ $Envi == "nonprod" ]];
then
    echo "----second step-----" >> newfile.txt
    echo $var1 >> newfile.txt
fi
file="newfile.txt"
while IFS= read -r line
do
        # display $line or do somthing with $line
        echo "$line"
done <"$file"
