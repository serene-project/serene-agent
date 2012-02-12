package Serene::Agent::Plugins;
#
# Serene::Agent::Plugins - The Serene Project 
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

use Schedule::Cron;

our @ISA= qw(Exporter);
our @EXPORT = qw(
  _init_scheduler
  _schedule_all	
);


sub _init_scheduler() {
  return new Schedule::Cron(\&dispatcher,skip => 1);
}


#XXX fake sub for testing purpose
sub munin($$) {
  my ($uuid,$probe) = @_; 
  print "running [ t: munin, p:$probe, u:$uuid ]\n";
}


sub _schedule($$$$$){
  my ($p_uuid, $p_type, $p_probe, $p_interval, $scheduler) = @_;

  #XXX must switch between p_type (serene, munin, custom, nagios)
  $scheduler->add_entry( $p_interval, {'subroutine'=>\&munin, 'arguments'=>[$p_uuid,$p_probe] } );
}


1;
