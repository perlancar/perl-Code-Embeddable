#!perl

use 5.010;
use strict;
use warnings;

use Code::Embeddable;
use Test::More 0.98;

subtest uniq => sub {
    is_deeply([Code::Embeddable::uniq(1,1,4,2,4,7,2,2)], [1,4,2,7]);
};

done_testing;
