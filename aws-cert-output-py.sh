#!/bin/sh
#!/usr/bin/env python2

echo "List of Certificates for $Envi that are going to expire is as follows." 
echo "=================================================================" 
echo ""
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> test.txt
cat test