#!/bin/sh
#!/usr/bin/env python2

echo "List of Certificates for $Envi that are going to expire is as follows." >> confluence/confluence
echo "=================================================================" >> confluence/confluence
echo "">> confluence/confluence
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> cat confluence/confluence
