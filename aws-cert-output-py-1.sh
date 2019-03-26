#!/bin/sh
mv confluence confluence-final
#!/usr/bin/env python2


cat confluence-final/confluence
echo "List of Certificates for $Envi that are going to expire is as follows." >> confluence-final/confluence
echo "=================================================================" >> confluence-final/confluence
echo "">> confluence/confluence
python git-test/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> confluence-final/confluence
cat confluence-final/confluence