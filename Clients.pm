use warnings;
use strict;

package Clients;

sub name {'Clients'}

sub add_items
{
	my $self = shift;
	my (@items) = @_;

	push(@{$self->{items}}, @items);
	return @items;
}
 sub new 
 {
	my $class = shift;
	
	my $self = 
	{
		JOINED_CHATROOM => shift, 
		CLIENT_IP=> shift,
		PORT => shift,
		CLIENT_NAME => shift,
		JOIN_ID => shift,
	};
	bless($self, $class);
	return($self);
}

sub getJOIN_ID
{
	my( $self ) = @_;
	return $self->{JOIN_ID};
}
sub getJOINED_CHATROOM
{
	my( $self ) = @_;
	return $self->{JOINED_CHATROOM};
}

sub getCLIENT_NAME
{
	my( $self ) = @_;
	return $self->{CLIENT_NAME};
}
1;