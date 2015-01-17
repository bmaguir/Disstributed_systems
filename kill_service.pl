use IO::Socket;

$msg = "KILL_SERVICE\n";

my $socket = IO::Socket::INET->new(
PeerAddr =>'localhost',
PeerPort => '500',
Proto => 'tcp'
) or die("Error :: $!");

print ($socket $msg);
shutdown($socket, 1);
my $recv_line;
#prints out what is received from the server
while ($recv_line = <$socket>){
print "$recv_line\n";
}

close $socket;