# -*- coding: utf-8 -*-
# 
# Script : certificate_analyze/core/__init__.py
# Author : wogjs2079
# 
# ====================== Comments ======================
#  

from time import sleep
from os   import getpid, getppid
import json
import requests

# Module Libraries
from const.default import MODULE, VERSION
from utils         import make_pretty, traceback_message

def analyze_ssl(domain, logger):
    url = f"https://api.ssllabs.com/api/v3/analyze?host={domain}&all=on"
    response = requests.get(url)
    
    while data.get('status') not in ['READY', 'ERROR']:
        logger.echo( msg = f"Waiting for analysis to complete for {domain}...", tag = 'PROGRESS' )
        time.sleep(10)
        response = requests.get(url)
        data = response.json()
    
    return data

def main( args, logger ):   #load domain or ip from args
    logger.debug( f'START [{ MODULE } V{ VERSION }]'     )
    logger.debug( f'args: [\n{ make_pretty( args ) }\n]' )
    
    logger.echo( msg=getpid() , tag="PID"  )
    logger.echo( msg=getppid(), tag="PPID" )

    file_path = 'a_ssl_test.json'   #for test
    domain = args['target']
    try :
        analyzed_ssl = analyze_ssl(domain, logger)
        
    except :
        logger.debug( traceback_message() )
        return 1
    
    logger.echo(msg = analyzed_ssl, tag="certificate_analyzed")
    with open( file_path, 'w') as f:
        json.dump(analyzed_ssl, f)

    return 0