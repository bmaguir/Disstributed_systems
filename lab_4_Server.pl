 use Thread;
 use warnings;
 #use strict;
 use IO::Socket;
 use Clients;
 use threads::shared;

 my $join_id :shared=();
 $join_id= 0;
 my @Client_list :shared=();
 my @ChatRoom_List :shared=();
 
	my $port = $ARGV[0];
	$socket = IO::Socket::INET->new(
		LocalPort => $port,
		Proto => 'tcp',
		Listen => 5,
		Reuse => 1
	)
	or die "Coudn't open socket$!" unless $socket;
	print "socket listening on port $port\n";
	my @thr;

	while(true){
		my $new_sock = $socket->accept();
		#adds a new thread to the pool to handle the client 
		print "got me a new coonektionzz\n";
		$thread_count = threads->list();
		#if the thread pool has not been used, start new thread
		if(thread_count < 5){
			push(@thr, new Thread \&sub1, $new_sock);
		}
		foreach(@thr){
			if ($_->is_joinable()) {
				$_->join();
			}
		}
	}


	sub sub1 { 
		my $thread_socket = $_[0];
		$thread_socket-> recv($msg, 1000, 0);
		#while(<$thread_socket>) {
		#	$msg = $_;
		#	print "$_\n";
		#}
		if($msg eq "KILL_SERVICE\n"){
			print $msg;
			close(thread_socket);
			exit &end;
		}
		else{
			if(substr($msg,0,4) eq "HELO")
			{
				my $address = "macneill.scss.tcd.ie";#$thread_socket->sockhost;
				$last_char = substr($msg,($msg.length-1), $msg.length);
				print "last char :{$last_char}:";
				print($thread_socket "${msg}IP:macneill.scss.tcd.ie\nPort:${port}\nStudentID:10366921");
				close($thread_socket);
			}
			else
			{
				if(substr($msg,0,14) eq "JOIN_CHATROOM:")
				{
					print "making new client";
					#splits $msg into [] segments
					my @lines = $msg =~ /( \[ (?: [^[]]* | (?0) )* \] )/xg;
					foreach my $line (@lines)
						{
						$line = substr $line, 1, -1;	#remove [] brakets
						}
					$join_id++;
					push (@Client_list, {$join_id,$lines[3]});
					push @ChatRoom_List, $lines[3];
					print $Client_list[0];
				}
				else
				{
					print "client said $msg";
					print($thread_socket "ack");
					close($thread_socket);
				}
			}
		}
	}

	sub end {
		print "closing socket\n";
		close($socket);
		#close socket and clean up all used threads
		foreach(@thr){
		if($_->is_joinable())
			{
			$_->detach();
			}
		}
	}