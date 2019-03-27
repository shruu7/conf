#!/bin/sh
#!/usr/bin/env python2

cat confluence-sandbox
echo "List of Certificates for $Envi that are going to expire is as follows." >> confluence-nonprod
echo "=================================================================" >> confluence-nonprod
echo "">> confluence-nonprod
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> confluence-nonprod
cat confluence-nonprod