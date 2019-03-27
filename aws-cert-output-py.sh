#!/bin/sh
#!/usr/bin/env python2

echo "List of Certificates for $Envi that are going to expire is as follows." >> confluencesandbox/confluencesandbox
echo "=================================================================" >> confluencesandbox/confluencesandbox
echo "">> confluencesandbox/confluencesandbox
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> confluencesandbox/confluencesandbox
cat confluencesandbox/confluencesandbox >> confluence