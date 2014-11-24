use warnings;
use strict;
use Clients;

my $bag = Clients->new(color => "red");

print $bag-> color;