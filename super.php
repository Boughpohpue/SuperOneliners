<?php
/**
 * Class Super
 *
 * Minimal, one-line implementations of algorithms solving some basic mathematical problems.
 */
class Super {
    static function power($n,$e)        { return $e==0 ? 1 : $e==1 ? $n : $n*self::power($n,$e-1); }
    static function digital_root($n)    { return $n<10 ? $n : self::digital_root(array_sum(str_split($n))); }
    static function dec2bin($d)         { return $d==0 ? "0" : self::dec2bin(intval($d/2)) . ($d%2); }
    static function bin2dec($b)         { return $b=="" ? 0 : (intval($b[0]))*pow(2, strlen($b)-1) + self::bin2dec(substr($b,1)); }
    static function dec2hex($d)         { return $d==0 ? "0" : self::dec2hex(intval($d/16)) . ($d%16<10 ? chr(48+($d%16)) : chr(65+($d%16-10))); }
    static function hex2dec($h)         { return $h=="" ? 0 : ((ord($h[0])<65 ? ord($h[0])-48 : ord($h[0])-55)*pow(16, strlen($h)-1)) + self::hex2dec(substr($h,1)); }
    static function is_prime($n,$cur=2) { return $n<2 ? false : $n==$cur ? true : $n%$cur==0 ? false : self::is_prime($n,$cur+1); }
	static function primes_list($max,$prms=[2],$cur=3) {
		return $cur>$max ? $prms : self::primes_list($max, (!array_filter($prms, fn($p)=>$cur%$p==0) ? [...$prms,$cur] : $prms), $cur+2);
	}
}
?>
