# super.py

class Super:
    '''
    Minimal, one-line implementations of algorithms solving some basic mathematical problems.
    '''
    power = staticmethod(lambda n, e: 1 if e == 0 else n if e == 1 else n * Super.power(n, e - 1))
    digital_root = staticmethod(lambda n: n if n < 10 else Super.digital_root(sum(map(int, str(n)))))
    dec2bin = staticmethod(lambda d: '0' if d == 0 else Super.dec2bin(d // 2) + str(d % 2))
    bin2dec = staticmethod(lambda b: 0 if not b else Super.power(2, len(b) - 1) * int(b[0]) + Super.bin2dec(b[1:]))
    dec2hex = staticmethod(lambda d: '0' if d == 0 else Super.dec2hex(d // 16) + chr(d % 16 + (ord('0') if d % 16 < 10 else ord('A') - 10)))
    hex2dec = staticmethod(lambda h: 0 if not h else (ord(h[0]) - (ord('0') if ord(h[0]) < ord('A') else ord('A') - 10)) * Super.power(16, len(h) - 1) + Super.hex2dec(h[1:]))
    prime_check = staticmethod(lambda n, _cur=2: False if n < 2 else True if _cur == n else False if n % _cur == 0 else Super.prime_check(n, _cur + 1))
    @staticmethod
    def primes_list(max: int, _prms: [int] = [2], _cur: int = 3) -> [int]:
        return _prms if _cur > max else Super.primes_list(max, (_prms if next((p for p in _prms if _cur % p == 0), None) else _prms + [_cur]), _cur + 2)
