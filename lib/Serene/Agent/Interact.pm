package Serene::Agent::Interact;
#
# Serene::Agent::Interact - The Serene Project 
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
