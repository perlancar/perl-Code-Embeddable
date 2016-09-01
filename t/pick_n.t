#!perl

use 5.010;
use strict;
use warnings;

use Code::Embeddable;
use Test::More 0.98;

# XXX test import()

subtest pick_n => sub {
    is_deeply([Code::Embeddable::pick_n(1)], []);
    is_deeply([Code::Embeddable::pick_n(2)], []);
    is_deeply([Code::Embeddable::pick_n(1, "a")], ["a"]);
    is_deeply([Code::Embeddable::pick_n(2, "a")], ["a"]);
    # XXX test randomness
};

done_testing;
