package Serene::Agent::Interact;

use strict;
use warnings;
use Exporter;

our @ISA= qw(Exporter);
our @EXPORT = qw(
	_ok
	_warn
	_error
	_die
);

sub _ok($) 	{ my $o = shift; print "[ok] $o\n" }
sub _warn($) 	{ my $o = shift; print "[warn] $o\n" }
sub _error($) 	{ my $o = shift; print "[err] $o\n" }
sub _die($)	{ my $o = shift; print "[err] $o\n"; exit 1; }

1;
