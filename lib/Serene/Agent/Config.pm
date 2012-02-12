package Serene::Agent::Config;
#
# Serene::Agent::Config - The Serene Project 
#
# Copyright (c) 2012, Alexandre De Dommelin <adedommelin@serene-project.net> 
# All rights reserved.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

use strict;
use warnings;
use Exporter;

use Config::Tiny;
use Serene::Agent::Interact;


use constant CFG_DIR          => '/etc/serene/serene-agent';
use constant CFG_PLUGINS_DIR  => '/etc/serene/serene-agent/plugins';

our @ISA= qw(Exporter);
our @EXPORT = qw(
	_load_agent_config
  _load_agent_plugins
);


sub _load_agent_config() {
  ( -f CFG_DIR."/config.ini" ) or _die "Unable to load Agent configuration";

  my $cfg = Config::Tiny->read( CFG_DIR."/config.ini" );
  return $cfg;
}



sub _load_agent_plugins($) {
  my $scheduler = shift;

  opendir(DIR, CFG_PLUGINS_DIR) or die $!;
  while ( my $file = readdir(DIR) ) {
    my $_f = CFG_PLUGINS_DIR."/".$file;
    next unless ( -f $_f && $file =~ m/\.conf$/ );

    my ($k) = ( $file =~ m/(.*)\.conf/ );

    my $plugin            = Config::Tiny->read($_f);
    my $_plugin_uuid      = $plugin->{$k}->{'uuid'};
    my $_plugin_type      = $plugin->{$k}->{'type'};
    my $_plugin_probe     = $plugin->{$k}->{'probe'};
    my $_plugin_interval  = $plugin->{$k}->{'interval'};

    Serene::Agent::Plugins::_schedule(  $_plugin_uuid,
                                        $_plugin_type,
                                        $_plugin_probe,
                                        $_plugin_interval,
                                        $scheduler  );    

    _ok "Loaded $file";
  }

  closedir(DIR);
}

1;
