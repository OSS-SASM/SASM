# -*- coding: utf-8 -*-
# 
# Script : certificate_search/core/__init__.py
# Author : wogjs2079
# 
# ====================== Comments ======================
#  

from time import sleep
from os   import getpid, getppid
from json import dumps
from requests import requests


# Module Libraries
from const.default import MODULE, VERSION
from utils         import make_pretty, traceback_message

def get_certificates(domain, logger):
    url = f"https://crt.sh/?q={domain}&output=json"
    response = requests.get(url)
    
    if response.status_code == 200:
        return response.json()
    else:
        logger.echo( msg = f"Failed to fetch data for {domain}, status code: {response.status_code}", tag = "ERROR" )
        return None

# output JSON type : issue_ca_id, issuer_name, common_name, name_value, id, entry_timestamp, not_before, not_after, serial_number, result_count

def main( args, logger ):   #load domain or ip from args
    logger.debug( f'START [{ MODULE } V{ VERSION }]'     )
    logger.debug( f'args: [\n{ make_pretty( args ) }\n]' )
    
    logger.echo( msg=getpid() , tag="PID"  )
    logger.echo( msg=getppid(), tag="PPID" )

    file_path = 'dns_test.json' #for test
    domain = args['target']
    certificates = get_certificates(domain, logger)
    logger.echo(msg=certificates, tag="certificate_search")
    with open( file_path, 'w') as f:
        json.dump(certificates, f)

    return 0