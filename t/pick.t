#!perl

use 5.010;
use strict;
use warnings;

use Code::Embeddable;
use Test::More 0.98;

subtest pick => sub {
    is_deeply([Code::Embeddable::pick()], [undef]);
    is_deeply([Code::Embeddable::pick(1)], [1]);
    # XXX test randomness
};

done_testing;
