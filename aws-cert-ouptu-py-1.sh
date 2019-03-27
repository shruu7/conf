#!/bin/sh
#!/usr/bin/env python2

cat confluencesandbox
echo "List of Certificates for $Envi that are going to expire is as follows." >> confluencenonprod/confluencenonprod
echo "=================================================================" >> confluencenonprod/confluencenonprod
echo "">> confluencenonprod
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> confluencenonprod/confluencenonprod
cat confluencenonprod