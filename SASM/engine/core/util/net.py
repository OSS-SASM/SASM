# -*- coding: utf-8 -*-
# 
# Script : SASM/engine/core/util/net.py
# Author : Hoon
#
# ====================== Comments ======================
#  

# Python Libraries
import os, sys
from   socket    import inet_aton
from   re        import search as re_search
from   re        import sub    as re_sub
from   re        import IGNORECASE
from   ipaddress import ip_network
from   itertools import chain
from   secrets   import token_bytes as random_token_bytes
from   string    import printable   as string_printable

# ENGINE Libraries
from engine.core.config.default import POTENTIAL_ENCODINGS

HTTP_STATUS = {
      100: "Continue"
    , 101: "Switching Protocol"
    , 102: "Processing"
    , 103: "Early Hints"

    , 200: "OK"
    , 201: "Created"
    , 202: "Accepted"
    , 203: "Non-Authoritative Information"
    , 204: "No Content"
    , 205: "Reset Content"
    , 206: "Partial Content"
    , 207: "Multi-Status"
    , 208: "Multi-Status"
    , 226: "IM Used"

    , 300: "Multiple Choice"
    , 301: "Moved Permanently"
    , 302: "Found"
    , 303: "See Other"
    , 304: "Not Modified"
    , 305: "Use Proxy"
    , 306: "unused"
    , 307: "Temporary Redirect"
    , 308: "Permanent Redirect"

    , 400: "Bad Request"
    , 401: "Unauthorized"
    , 402: "Payment Required"
    , 403: "Forbidden"
    , 404: "Not Found"
    , 405: "Method Not Allowed"
    , 406: "Not Acceptable"
    , 407: "Proxy Authentication Required"
    , 408: "Request Timeout"
    , 409: "Conflict"
    , 410: "Gone"
    , 411: "Length Required"
    , 412: "Precondition Failed"
    , 413: "Payload Too Large"
    , 414: "URI Too Long"
    , 415: "Unsupported Media Type"
    , 416: "Requested Range Not Satisfiable"
    , 417: "Expectation Failed"
    , 418: "I'm a teapot"
    , 421: "Misdirected Request"
    , 422: "Unprocessable Entity"
    , 423: "Locked"
    , 424: "Failed Dependency"
    , 426: "Upgrade Required"
    , 428: "Precondition Required"
    , 429: "Too Many Requests"
    , 431: "Request Header Fields Too Large"
    , 451: "Unavailable For Legal Reasons"

    , 500: "Internal Server Error"
    , 501: "Not Implemented"
    , 502: "Bad Gateway"
    , 503: "Service Unavailable"
    , 504: "Gateway Timeout"
    , 505: "HTTP Version Not Supported"
    , 506: "Variant Also Negotiates"
    , 507: "Insufficient Storage"
    , 508: "Loop Detected"
    , 510: "Not Extended"
    , 511: "Network Authentication Required"
}

# 랜덤한 수를 생성하는 함수 (패킷 id 생성에 사용)
def random_int_from_bytes( nbytes ):
    return int.from_bytes( random_token_bytes( nbytes ), byteorder='big' )

# IP 범위로 표현된 문자열을 파싱하여 리스트로 리턴하는 함수 ('10.10.50.50,192.168.0.0/24' -> ['10.10.50.50', '192.168.0.1', '192.168.0.2', ..., '192.168.0.254'])
def parseRangedAddress( addresses ):
    address_list = []

    addresses = addresses.split(',')
    while len( addresses ):
        address = addresses.pop()
        address = address.replace( ' ', '' )

        # Exact 1 ip
        match = re_search( r'^(\d+\.\d+\.\d+\.\d+)(\/32|)$', address )
        if match:
            
            ip = match.group( 1 )
            try   : inet_aton( ip )
            except: pass
            else  :
                address_list += [ ip ]
                continue

        # Hypened ip range (/24)
        match = re_search( r'^(\d+\.\d+\.\d+\.)(\d+\-\d+)$', address )
        if match:
            parts = match.group( 2 ).split('-')
            address_list += [ f"{ match.group( 1 ) } + { str( i ) }" for i in range( int( parts[ 0 ] ), min( int( parts[ -1 ] ), 255 ) + 1 ) ]

        # CIDR
        try:
            cidr_hosts = [ str( ip ) for ip in list( ip_network( address ).hosts() ) ]

        except:
            pass

        else:
            address_list += cidr_hosts
            continue

    return sorted( address_list, key=lambda x: inet_aton( x ) )

# '1-5' -> [1, 2, 3, 4, 5]
def parse_range_number(r):
    if len(r) == 0: return []
    else:
        parts = r.split('-')
        if len(parts) > 2: raise ValueError( 'Invalid range: {}'.format(r) )
        else:              return range(int(parts[0]), int(parts[-1]) + 1)

# 숫자를 범위로 표현한 문자열을 리스트로 변환하는 함수 ('1-5,8,9' -> [1, 2, 3, 4, 5, 8, 9])
def parseRangedNumber(ports, maximum=None):
    port_list = set( chain.from_iterable( map(parse_range_number, ports.split(',') ) ) )
    port_list = sorted(port_list)

    if isinstance(maximum, int):
        i = 0
        for port in port_list:
            if port > maximum:
                break
            i += 1

        port_list = port_list[:i]

    return port_list

# IP 리스트를 범위로 표현된 문자열로 변환하는 함수 (['10.10.50.50', '192.168.0.1', '192.168.0.2', '192.168.0.3'] -> '10.10.50.50,192.168.0.1-3')
def compress_ip_list_to_str(ip_list):
    sorted_ip_list = sorted( ip_list, key=lambda x: inet_aton(x) )
    compress_ip_str = ''

    while len(sorted_ip_list):
        ip = sorted_ip_list.pop(0)
        ip_split = ip.split('.')
        prefix = '.'.join(ip_split[:3])
        postfix = ip_split[-1]

        pattern = r'(\d+\.\d+\.\d+)\.(\d+\-|)(\d+)$'
        match = re_search(pattern, compress_ip_str, IGNORECASE)
        if match:
            if ( prefix == match.group(1) ) and ( ( int(postfix) - int( match.group(3) ) ) == 1 ):
                compress_ip_str = re_sub(pattern, '', compress_ip_str)
                if len( match.group(2) ):
                    compress_ip_str += '{}.{}{}'.format(prefix, match.group(2), postfix)
                else:
                    compress_ip_str += '{}.{}-{}'.format(prefix, match.group(3), postfix)
            else:
                compress_ip_str += ',{}'.format(ip)
        else:
            compress_ip_str += ip

    return compress_ip_str

# 숫자 리스트를 범위로 표현된 문자열로 변환하는 함수 ([1, 2, 3, 4, 5, 8, 9] -> '1-5,8-9')
def compress_number_list_to_str(number_list):
    sorted_number_list = sorted( number_list, key=lambda x: int(x) )
    compress_number_str = ''

    while len(sorted_number_list):
        number = sorted_number_list.pop(0)
        if isinstance(number, int):
            number_str = str(number)
        else:
            number_str = number

        pattern = r'(\d+\-|)(\d+)$'
        match = re_search(pattern, compress_number_str, IGNORECASE)
        if match:
            if ( int(number_str) - int( match.group(2) ) ) == 1:
                compress_number_str = re_sub(pattern, '', compress_number_str)
                if len( match.group(1) ):
                    compress_number_str += '{}{}'.format(match.group(1), number_str)
                else:
                    compress_number_str += '{}-{}'.format(match.group(2), number_str)
            else:
                compress_number_str += ',{}'.format(number_str)
        else:
            compress_number_str += number_str

    return compress_number_str

# bytes로 된 바이너리 값에서 아스키 문자열로 변환할수 있는 부분만 변환하여 반환하는 함수
def get_ascii_from_raw(raw, remove_whitespace=False, preserve_raw=False, alt_char='.'):
    if preserve_raw:
        if alt_char:
            s = ''.join([chr(c) if chr(c) in string_printable else alt_char for c in raw])
        else:
            s = ''.join([chr(c) if chr(c) in string_printable else '\\x' + f'{c:02x}' for c in raw])
    else:
        s = ''.join([chr(c) if chr(c) in string_printable else '' for c in raw])

    if remove_whitespace:
        s = re_sub(r'\s', '', s)

    return s

# requests 모듈로 요청했을때 리턴값인 response 객체를 문자열(실제 응답 패킷 데이터)로 변환하는 함수
def get_raw_from_parsed_http_response(response):
    raw = f'HTTP/{response.raw.version / 10} {response.status_code} { HTTP_STATUS[ response.status_code ] }\r\n'
    for k, v in response.headers.items():
        raw += f'{k}: {v}\r\n'

    # raw = raw.encode()
    raw = raw.encode() + response.content

    return raw

# NetBios 패킷 데이터에서 호스트네임을 파싱하는 함수
def get_hostname_from_nbns_raw(raw):
    hostname_raw = b''
    hostname = ''

    if raw[2:4] == b'\x84\x00' and len(raw) > 57:
        name_count = raw[56]
        start = 57

        for _ in range(name_count):
            flags         = int.from_bytes(raw[start+16:start+17], byteorder='big')
            is_group_name = bool(flags & 0b10000000)
            is_active     = bool(flags & 0b00000100)
            
            if not is_group_name and is_active:
                for encoding in POTENTIAL_ENCODINGS:
                    try        : hostname = raw[start:start+15].decode(encoding).strip()
                    except     : continue
                    if hostname: return hostname

            start += 18

    return hostname

if __name__ == '__main__':
    raw = b'\x80\xf0\x84\x00\x00\x00\x00\x01\x00\x00\x00\x00 CKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\x00\x00!\x00\x01\x00\x00\x00\x00\x00w\x04\xbf\xac\xb1\xb8\xbc\xd2-QKR0220  \x04\x00WORKGROUP      \x00\x84\x00\xbf\xac\xb1\xb8\xbc\xd2-QKR0220 \x00\x04\x00WORKGROUP      \x1e\x84\x00p\x85\xc2@!\r\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    print(get_hostname_from_nbns_raw(raw))
    
    # a = parseRangedAddress('192.168.56.101-105,10.10.50.101,192.168.56.4/30')
    # print(a)

    # b1 = parseRangedNumber('5,7,20-23,3-6,80,81,83,234631463146', maximum=65535)
    # print(b1)

    # b2 = parseRangedNumber('5,7,20-23,3-6,80,81,83,234631432462134663146,655461-655465', maximum=None)
    # print(b2)

    # c = compress_ip_list_to_str(['10.10.50.101', '192.168.56.5', '192.168.56.6', '192.168.56.101', '192.168.56.102', '192.168.56.103', '192.168.56.104', '192.168.56.105'])
    # print(c)

    # d = compress_number_list_to_str([3, 4, 5, 6, 7, 20, 21, 22, 23, 80, 81, 83, 65323333])
    # print(d)

    # e = compress_number_list_to_str(['20', '21', '22', '23', '3', '4', '5', '6', '65323333', '7', '80', '81', '83'])
    # print(e)

    # f = compress_ip_list_to_str([])
    # print(f'[{f}]')

    # g = get_ascii_from_raw(b'')
    # print('end')
