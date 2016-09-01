#!perl

use 5.010;
use strict;
use warnings;

use Code::Embeddable;
use Test::More 0.98;

subtest shuffle => sub {
    is_deeply([Code::Embeddable::shuffle()], []);
    is_deeply([Code::Embeddable::shuffle(1)], [1]);
    # XXX test randomness
};

done_testing;
