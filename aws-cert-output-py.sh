#!/bin/sh
#!/usr/bin/env python2
cat confluence
echo "List of Certificates for $Envi that are going to expire is as follows." >> confluence
echo "=================================================================" >> confluence
echo "">> confluence
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> confluence
cat confluence