package Serene::Agent::Config;

use strict;
use warnings;
use Exporter;

our @ISA= qw(Exporter);
our @EXPORT = qw(
	_load_config
);


sub _load_config() {
	my $cfg_dir = "/home/adedommelin/src/serene-agent/etc/serene-agent/";
	return 1 if ( ! -f $cfg_dir."/config.ini" || ! -f $cfg_dir."/server.ini" );

	return 0;
}


sub _load_plugins() {
	my $plugins_cfg_dir = '/home/adedommelin/src/serene-agent/etc/serene-agent/plugins';

	opendir(DIR, $plugins_cfg_dir) or die $!;
	while (my $file = readdir(DIR)) {
	    next unless ( -f "$plugins_cfg_dir/$file" && $file =~ m/\.conf$/ );
	    print "Loading $file ...\n";
	}
	closedir(DIR);
	return 0;
}

1;
