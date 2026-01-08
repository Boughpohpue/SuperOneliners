=head1 NAME

Super

=head1 DESCRIPTION

Minimal, one-line implementations of algorithms solving some basic mathematical problems.

=cut
package Super;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(power digital_root dec2bin bin2dec dec2hex hex2dec is_prime primes_list);

sub power        { $_[1]==0 ? 1 : $_[1]==1 ? $_[0] : $_[0]*power($_[0], $_[1]-1) }
sub digital_root { $_[0]<10 ? $_[0] : digital_root(eval join '+', split //, $_[0]) }
sub dec2bin      { $_[0]==0 ? "0" : dec2bin(int($_[0]/2)) . ($_[0]%2) }
sub bin2dec      { $_[0] eq "" ? 0 : 2**(length($_[0])-1)*substr($_[0],0,1) + bin2dec(substr($_[0],1)) }
sub dec2hex      { $_[0]==0 ? "0" : dec2hex(int($_[0]/16)) . (($_[0]%16)<10 ? chr(48+$_[0]%16) : chr(65+$_[0]%16-10)) }
sub hex2dec      { $_[0] eq "" ? 0 : (substr($_[0],0,1) lt 'A' ? ord(substr($_[0],0,1))-48 : ord(substr($_[0],0,1))-55)*16**(length($_[0])-1) + hex2dec(substr($_[0],1)) }
sub is_prime     { $_[0]<2 ? 0 : $_[0]==$_[1] ? 1 : $_[0]%$_[1]==0 ? 0 : is_prime($_[0], $_[1]+1) }
sub primes_list  { my($max,$prms,$cur)=@_; $prms//=[2]; $cur//=3; return @$prms if $cur>$max; push(@$prms,$cur) unless grep { $cur%$_==0 } @$prms; return primes_list($max,$prms,$cur+2) }

1;
