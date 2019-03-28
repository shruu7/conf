#!/bin/bash
#!/usr/bin/env python2

var=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)
var1=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)
var2=$(python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90)

    echo "List of Certificates for $Envi that are going to expire is as follows." >> new
    echo "=================================================================" >> new
    echo "" >> new

if [[ $Envi == "sandbox" ]]; 
then
    cat new
    echo "first step" > newfile.txt
    echo $var >> newfile.txt
elif [[ $Envi == "nonprod" ]];
then
    cat new
    echo "----second step-----" >> newfile.txt
    echo $var1 >> newfile.txt
fi