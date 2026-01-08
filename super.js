/* Minimal, one-line implementations of algorithms solving some basic mathematical problems.*/
class Super {
    static power = (n, e) => e === 0 ? 1 : e === 1 ? n : n * Super.power(n, e - 1);
    static digitalRoot = n => n < 10 ? n : Super.digitalRoot([...n.toString()].reduce((sum, c) => sum + (+c), 0));
    static dec2bin = d => d === 0 ? "0" : Super.dec2bin(Math.floor(d / 2)) + (d % 2);
    static bin2dec = b => b.length === 0 ? 0 : Super.power(2, b.length - 1) * (+b[0]) + Super.bin2dec(b.slice(1));
    static dec2hex = d => d === 0 ? "0" : Super.dec2hex(Math.floor(d / 16)) + (d % 16 < 10 ? String.fromCharCode(48 + (d % 16)) : String.fromCharCode(65 + (d % 16 - 10)));
    static hex2dec = h => h.length === 0 ? 0 : (h[0] < 'A' ? h.charCodeAt(0) - 48 : h.charCodeAt(0) - 55) * Super.power(16, h.length - 1) + Super.hex2dec(h.slice(1));
    static isPrime = (n, _cur = 2) => n < 2 ? false : n === _cur ? true : n % _cur === 0 ? false : Super.isPrime(n, _cur + 1);
    static primes = (max, _prms = [2], _cur = 3) => _cur > max ? _prms : (!_prms.some(p => _cur % p === 0) ? Super.primes(max, [..._prms, _cur], _cur + 2) : Super.primes(max, _prms, _cur + 2));
}
