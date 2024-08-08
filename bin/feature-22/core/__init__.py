# -*- coding: utf-8 -*-
# 
# Script : feature-22/core/__init__.py
# Author : LRTK
# 
# ====================== Comments ======================
#  

from time import sleep
from os   import getpid, getppid
from requests import get

# Module Libraries
from const.default import MODULE, VERSION
from utils         import make_pretty, traceback_message

def main( args, logger ):
    # Refense: https://wiki.leakcheck.io/en/api
    
    logger.debug( f'START [{ MODULE } V{ VERSION }]'     )
    logger.debug( f'args: [\n{ make_pretty( args ) }\n]' )
    
    url = 'http://leakcheck.io/api/public'
    farams = { 'check': args['email'] }
    
    response = get(url, farams)
    api_result = response.json()
    
    if 'sources' in api_result:
        result = { 'success':api_result['success'], 'find':len(api_result['sources']) }
        for idx in range(len(api_result['sources'])):
            result[idx+1] = api_result['sources'][idx]
    else:
        result = { 'success':api_result['success'], 'find':0 }
    
    logger.echo( msg=result, tag='feature-22' )
    
    return 0