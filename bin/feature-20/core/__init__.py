# -*- coding: utf-8 -*-
# 
# Script : starter/core/__init__.py
# Author : LRTK
# 
# ====================== Comments ======================
#  

from time import sleep
import requests

# Module Libraries
from const.default import MODULE, VERSION
from utils         import make_pretty, traceback_message


def builtwithAPI(api_key, target, logger):
    url = 'https://api.builtwith.com/free1/api.json'
    params = {
        'KEY': api_key,
        'LOOKUP': target
    }
    
    try:
        response = requests.get(url, params=params)
        response.raise_for_status()
        
        try:
            data = response.json()
            
        except ValueError as e:
            return 1

        if 'Errors' in data:
            return 1
        else:
            return data
        
    except requests.exceptions.HTTPError as e:
        return 1
    
    except requests.exceptions.ConnectionError as e:
        return 1
    
    except requests.exceptions.Timeout as e:
        return 1
    
    except requests.exceptions.RequestException as e:
        return 1

def main( args, logger ):
    logger.debug( f'START [{ MODULE } V{ VERSION }]'     )
    logger.debug( f'args: [\n{ make_pretty( args ) }\n]' )
    
    data = builtwithAPI(args['api_key'], args['target'], logger)
    logger.echo(msg=data, tag="feature-20")
    
    return 0