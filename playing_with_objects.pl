use warnings;
use strict;
use Clients;

my $Client = new Clients ("THE chat room","0", "0", "derp");

print &$Client{PORT};
#print $Client-> getFName;