#!/bin/sh
#!/usr/bin/env python2
cat confluence/confluence
echo "List of Certificates for $Envi that are going to expire is as follows." >> confluence/confluence
echo "=================================================================" >> confluence/confluence
echo "">> confluence/confluence
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> confluence/confluence
cat confluence/confluence