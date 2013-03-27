#!/usr/bin/env perl
#
# Copyright (C) 2013 Joshua Keroes
# This program is released under the Artistic License 2.0.
# http://opensource.org/licenses/artistic-license-2.0

use 5.12.1;  # for say and given
use strict;
use warnings;
use Getopt::Long;
use Net::CIDR::Set;

my @add;
my @remove;
my $as = "string";
my $help;

GetOptions (
	"add|a=s"       => \@add,
	"remove|r=s"    => \@remove,
	"as=s"          => \$as,
	"help|h!"       => \$help,
);

# handle comma-separated args
@add    = split (/,/, join (',', @add));
@remove = split (/,/, join (',', @remove));

if ($help || !@add) {
	print usage();
	exit 1;
}

my $set = Net::CIDR::Set->new(@add);
$set->remove(@remove);

given ($as) {
	say join "\n", $set->as_address_array when /^a/;        
	say join "\n", $set->as_cidr_array    when /^c/;     
	say join "\n", $set->as_range_array   when /^r/;      
	say join "\n", $set->as_string;
}

exit;

sub usage {
	return <<END;
$0 [options]

	CIDRs, ranges, and individual IP's are accepted:

	--add=1.1.1.1/8
	--remove=1.1.1.1/23,1.2.2.2/15,1.18.18.18/24

    Output options:

	--as=string | cidrs | addresses | ranges  [default: string]
	--as=s      | c     | a         | r

	--help

END
}
