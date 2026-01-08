/* Minimal, one-line implementations of algorithms solving some basic mathematical problems. */

CREATE FUNCTION super_power(n INT, e INT)
RETURNS INT
LANGUAGE SQL
AS $$
WITH RECURSIVE p(n,e,r) AS (SELECT n,e,1 UNION ALL SELECT n,e-1,r*n FROM p WHERE e>0) SELECT r FROM p WHERE e=0
$$;

CREATE FUNCTION super_digital_root(n INT)
RETURNS INT
LANGUAGE SQL
AS $$
WITH RECURSIVE dr(n) AS (SELECT n UNION ALL SELECT (SELECT SUM(SUBSTR(n::text,i,1)::int) FROM generate_series(1,LENGTH(n::text)) i) FROM dr WHERE n>=10) SELECT n FROM dr ORDER BY n LIMIT 1
$$;

CREATE FUNCTION super_dec2bin(d INT)
RETURNS TEXT
LANGUAGE SQL
AS $$
WITH RECURSIVE b(n,s) AS (SELECT d,'' UNION ALL SELECT n/2,(n%2)::text||s FROM b WHERE n>0) SELECT COALESCE(s,'0') FROM b WHERE n=0
$$;

CREATE FUNCTION super_bin2dec(b TEXT)
RETURNS INT
LANGUAGE SQL
AS $$
WITH RECURSIVE d(s,r) AS (SELECT b,0 UNION ALL SELECT SUBSTR(s,2),r*2+(SUBSTR(s,1,1)::int) FROM d WHERE s<>'') SELECT r FROM d WHERE s=''
$$;

CREATE FUNCTION super_dec2hex(d INT)
RETURNS TEXT
LANGUAGE SQL
AS $$
WITH RECURSIVE h(n,s) AS (SELECT d,'' UNION ALL SELECT n/16,CHR(CASE WHEN n%16<10 THEN 48+n%16 ELSE 55+n%16 END)||s FROM h WHERE n>0) SELECT COALESCE(s,'0') FROM h WHERE n=0
$$;

CREATE FUNCTION super_hex2dec(h TEXT)
RETURNS INT
LANGUAGE SQL
AS $$
WITH RECURSIVE d(s,r) AS (SELECT h,0 UNION ALL SELECT SUBSTR(s,2),r*16+(CASE WHEN SUBSTR(s,1,1)<'A' THEN ASCII(SUBSTR(s,1,1))-48 ELSE ASCII(SUBSTR(s,1,1))-55 END) FROM d WHERE s<>'') SELECT r FROM d WHERE s=''
$$;

CREATE FUNCTION super_is_prime(n INT)
RETURNS BOOLEAN
LANGUAGE SQL
AS $$
SELECT n>=2 AND NOT EXISTS (SELECT 1 FROM generate_series(2,FLOOR(SQRT(n))) d WHERE n%d=0)
$$;

CREATE FUNCTION super_primes(max_n INT)
RETURNS TABLE(n INT)
LANGUAGE SQL
AS $$
SELECT n FROM generate_series(2,max_n) n WHERE NOT EXISTS (SELECT 1 FROM generate_series(2,FLOOR(SQRT(n))) d WHERE n%d=0)
$$;



/*
-- LOADING FUNCTIONS
psql -f super.sql


-- EXAMPLE USAGE
SELECT super_power(2,5);          -- 32
SELECT super_digital_root(498);   -- 3
SELECT super_dec2bin(13);         -- 1101
SELECT super_bin2dec('1101');     -- 13
SELECT super_dec2hex(255);        -- FF
SELECT super_hex2dec('FF');       -- 255
SELECT super_is_prime(29);        -- true
SELECT * FROM super_primes(50);
*/
