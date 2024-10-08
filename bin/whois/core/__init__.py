# -*- coding: utf-8 -*-
# 
# Script : whois/core/__init__.py
# Author : Hoon
# 
# ====================== Comments ======================
#  

from os   import getpid, getppid
from re   import search as re_search
from json import dumps  as json_dumps

# Module Libraries
from const.default import MODULE, VERSION
from const.regex   import REGEX_IP_SINGLE
from utils         import make_pretty, http_request, Thread, findIP

def main( args, logger ):
    logger.echo( msg=getpid() , tag="PID"  )
    logger.echo( msg=getppid(), tag="PPID" )

    result = {}

    ##########################################################################################################################################################################################
    # Targets
    ##########################################################################################################################################################################################
    args[ 'targets' ] = [ t.strip() for t in args[ 'targets' ].split( ',' ) ]

    logger.debug( f'START [{ MODULE } V{ VERSION }]'     )
    logger.debug( f'args: [\n{ make_pretty( args ) }\n]' )

    ##########################################################################################################################################################################################
    # Index
    ##########################################################################################################################################################################################
    index      = 0
    last_index = len( args[ 'targets' ] )

    while index < last_index:
        
        ####################################################################################################################################################
        # Initialize dictionary for worker threads
        ####################################################################################################################################################
        workers = {}

        ####################################################################################################################################################
        # Create threads
        ####################################################################################################################################################
        for _ in range( args[ 'thread_count' ] ):

            workers[ index ] = Thread(
                  func   = http_request
                , kwargs = {
                      'target'  : args[ 'targets' ][ index ]
                    , 'timeout' : args[ 'request_timeout' ]
                }
            )

            ####################################################################################################################
            # Escape the loop
            ####################################################################################################################
            if ( index := index+1 ) >= last_index:
                break
        
        ####################################################################################################################################################
        # Run every thread
        ####################################################################################################################################################
        for w in workers.values():
            w.daemon = True
            w.start()
        
        ####################################################################################################################################################
        # findIP API response cache
        ####################################################################################################################################################
        findIPCache = {}

        ####################################################################################################################################################
        # 
        ####################################################################################################################################################
        for i, w in workers.items():
            
            ####################################################################################################################
            # Wait until every thread done they work
            ####################################################################################################################
            w.join()

            logger.echo( msg=f'{( i / last_index * 100 ):.2f}', tag='PROGRESS' )

            ####################################################################################################################
            # Get return values from every single thread
            ####################################################################################################################
            for target, response in w.get_result().items():
                
                result[ target ] = { 'response' : response }

                for r in response:

                    if  ( re_search( REGEX_IP_SINGLE, r[ 'ip' ] ) )\
                    and ( r[ 'ip' ] not in findIPCache            ):
                    
                        findIPCache[ r[ 'ip' ] ] = Thread(
                              func   = findIP
                            , kwargs = {
                                  'targetIp' : r   [ 'ip'      ]
                                , 'apiKey'   : args[ 'api_key' ]
                            }
                        )

        ####################################################################################################################################################
        # Run every threads
        ####################################################################################################################################################
        for f in findIPCache.values():
            f.daemon = True
            f.start()

        ####################################################################################################################################################
        # Wait until every thread done they work
        ####################################################################################################################################################
        for f in findIPCache.values():
            f.join()

        ####################################################################################################################################################
        # Get return values from every single thread
        ####################################################################################################################################################
        for a, f in findIPCache.items():
            findIPCache[ a ] = f.get_result()

    for k, v in result.items():
        for r in v[ 'response' ]:
            result[ k ][ 'findIP' ] = findIPCache[ r[ 'ip' ] ]
            break

    logger.debug( json_dumps( result, indent=4, default=lambda x: str( x ) ) )

    logger.echo(
          msg = json_dumps( result, indent=4, default=lambda x: str( x ) )
        , tag = 'RESULT'
    )

    return 0