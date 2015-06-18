#!perl

use 5.010;
use strict;
use warnings;

# INSERT_BLOCK: lib/Code/Embeddable.pm stacktrace_printer

use Capture::Tiny qw(capture);
use Test::More 0.98;

my $stderr;

(undef, undef, undef) = capture { eval { die }; $stderr = $@ };
like($stderr, qr/ called at .+ called at /s) or diag $stderr;

(undef, $stderr, undef) = capture { warn };
like($stderr, qr/ called at .+ called at /s) or diag $stderr;

done_testing;
