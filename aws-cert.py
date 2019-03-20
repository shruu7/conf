#!/usr/bin/env python2
import os
os.system("pip install botocore > /dev/null")
import botocore.session
from os import environ
import argparse
from datetime import datetime
os.system("pip install --upgrade pip > /dev/null")

#change region to match desired region
region = 'us-east-1'


class CertClass(object):
    def __init__(self, arn, domain, status, created, expiration, renewalstatus):
        self.arn = arn
        self.domain = domain
        self.status = status
        self.created = created
        self.expiration = expiration
        self.renewalstatus = renewalstatus
    def __str__(self):
        printstring = 'Certificate for domain: ' + str(self.domain) + '\n'
        printstring += 'Created at: ' + str(self.created) + '\n'
        printstring += 'with Status: ' + str(self.status) + '\n'
        printstring += 'is set to expire: ' + str(self.expiration) + '\n'
        printstring += 'with Renewal Status: ' + str(self.renewalstatus) + '\n'
        return printstring

def getCerts():
    if 'AWS_PROFILE' in environ:
        session = botocore.session.Session(profile=environ['AWS_PROFILE'])
    else:
        session = botocore.session.get_session()

    certclient = session.create_client('acm', region_name=region)
    paginator = certclient.get_paginator('list_certificates')
    response_iterator = paginator.paginate()
    certs = []
    for item in response_iterator:
        for certificate in item['CertificateSummaryList']:
            arn = certificate['CertificateArn']

            certjson = certclient.describe_certificate(CertificateArn=arn)
            domainname = (certjson['Certificate']['DomainName'])
            notAfter = createdAt = status = renewalStatus = None
            for jsonitem in certjson['Certificate']:
                if jsonitem == 'CreatedAt':
                    createdAt = (certjson['Certificate'][str(jsonitem)])
                if jsonitem == 'NotAfter':
                    notAfter = (certjson['Certificate'][str(jsonitem)])
                if jsonitem == 'Status':
                    status = certjson['Certificate'][str(jsonitem)]
                if jsonitem == 'RenewalSummary':
                    renewalStatus = certjson['Certificate'][str(jsonitem)]['RenewalStatus']
            certs.append(CertClass(arn, domainname, status, createdAt, notAfter, renewalStatus))
    return certs

def getExpiringSoonCerts(certs, daysleft):
    expiringsoon = []
    for cert in certs:
        if cert.expiration != None and cert.status == 'ISSUED':
            if (cert.expiration.replace(tzinfo=None) - datetime.utcnow()).days <= int(daysleft):
                expiringsoon.append(cert)
    return expiringsoon

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Snags Certificates from AWS')
    parser.add_argument('-action', '--action', help='Action to perform', required=False)
    parser.add_argument('-daysleft', '--daysleft', help='Show those days with days left within this threshold', required=False)
    args = vars(parser.parse_args())
    action = args['action']
    daysleft = args['daysleft']

    if action == None:
        action = 'LISTALL'
    if daysleft == None:
        daysleft = 30

    certs = getCerts()

    if action.upper() == 'LISTALL':
        for c in certs:
            print(str(c))
    elif action.upper() == 'LISTEXPIRED':
        for c in certs:
            if c.status == 'EXPIRED':
                print(c)
    elif action.upper() == 'LISTEXPIRING':
        expiringsoon = getExpiringSoonCerts(certs, daysleft)
        for e in expiringsoon:
            print(e)
    else:
        print('Nothing to do....')

