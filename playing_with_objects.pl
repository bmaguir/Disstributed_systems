use warnings;
use strict;
use Clients;

my @array;

my $Client = new Clients ("THE chat room","0", "0", "derp", "1234");

#print $Client-> getJOIN_ID;
#print $Client-> getFName
	my $msg = "JOIN_CHATROOM: [DaBois]
CLIENT_IP: [0]
PORT: [0]
CLIENT_NAME: [dicky]";
#my @lines = split /[/, $msg;
my @lines = $msg =~ /( \[ (?: [^[]]* | (?0) )* \] )/xg;

foreach my $line (@lines){
	$line = substr $line, 1, -1;
}
push @array, @lines;

$msg = "JOIN_CHATROOM: [DaBois]
CLIENT_IP: [0]
PORT: [0]
CLIENT_NAME: [micky]";
#my @lines = split /[/, $msg;
@lines = $msg =~ /( \[ (?: [^[]]* | (?0) )* \] )/xg;

foreach my $line (@lines){
	$line = substr $line, 1, -1;
}
print $array[1];