#!/bin/sh
#!/usr/bin/env python2

echo "List of Certificates for $Envi that are going to expire is as follows." >> confluencesandbox
echo "=================================================================" >> confluencesandbox
echo "">> confluencesandbox
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> confluencesandbox
cat confluencesandbox