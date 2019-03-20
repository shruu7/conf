#!/bin/sh
#!/usr/bin/env python2

echo "List of Certificates for $Envi that are going to expire is as follows." > confluence
echo "=================================================================" >> confluence
echo "">> confluence
python bit-bucket/pcf_automation/aws-checker/aws-cert.py --action=LISTEXPIRING --daysleft=90 >> confluence
