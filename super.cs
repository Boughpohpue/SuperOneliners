/// <summary>
/// Minimal, one-line implementations of algorithms solving some basic mathematical problems.
/// </summary>
public static class Super
{
    public static int Power(int n, uint e) => e == 0 ? 1 : e == 1 ? n : n * Power(n, e - 1);
    public static int DigitalRoot(int n) => n < 10 ? n : DigitalRoot($"{n}".ToArray().Sum(c => c - '0'));
    public static string Dec2Bin(int d) => d == 0 ? "0" : $"{Dec2Bin(d / 2)}{d % 2}".TrimStart('0');
    public static int Bin2Dec(string b) => b.Length == 0 ? 0 : (Power(2, (uint)(b.Length - 1)) * (b[0] - '0')) + Bin2Dec(b.Substring(1));
    public static string Dec2Hex(int d) => d == 0 ? "0" : $"{Dec2Hex(d / 16)}{(char)(d % 16 + (d % 16 < 10 ? '0' : 'A' - 10))}".TrimStart('0');
    public static int Hex2Dec(string h) => h.Length == 0 ? 0 : (Power(16, (uint)(h.Length - 1)) * (h[0] - (h[0] < 'A' ? '0' : 'A' - 10))) + Hex2Dec(h.Substring(1));
    public static bool IsPrime(uint n, uint _cur = 2) => n < 2 ? false : n == _cur ? true : n % _cur == 0 ? false : IsPrime(n, _cur + 1);
    public static IEnumerable<uint> Primes(uint max, string _prms = "2", uint _cur = 3) =>
        _cur > max ? _prms.Split(',').Select(uint.Parse) : Primes(max, (_prms.Split(',').Any(p => _cur % uint.Parse(p) == 0) ? _prms : $"{_prms},{_cur}"), _cur + 2);
}
