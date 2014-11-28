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
	};
	bless($self, $class);
	return($self);
}

sub getFName
{
	my( $self ) = @_;
	return $self->{fname};
}

sub color 
{
	my $self = shift;
	return $self->{color};
}
1;