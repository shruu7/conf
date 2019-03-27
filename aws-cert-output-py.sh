#!/bin/sh
#!/usr/bin/env python2

echo "List of Certificates for $Envi that are going to expire is as follows." >> confluence-sandbox
echo "=================================================================" >> confluence-sandbox
echo "">> confluence-sandbox
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> confluence-sandbox
cat confluence-sandbox