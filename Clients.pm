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
	my %options = @_;
	
	
	my $self = 
	{
		color => 'blue', 
		%options,
		items => [],
	};
	bless($self, $class);
	return($self);
}

sub color 
{
	my $self = shift;
	return $self->{color};
}
1;