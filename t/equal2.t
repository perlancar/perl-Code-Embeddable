#!perl

use 5.010;
use strict;
use warnings;

use Code::Embeddable;
use Test::More 0.98;

subtest equal2 => sub {
    # undef only equals undef
    ok( Code::Embeddable::equal2(undef, undef));
    ok(!Code::Embeddable::equal2(undef, 0));
    ok(!Code::Embeddable::equal2(undef, 1));
    ok(!Code::Embeddable::equal2(undef, ""));
    ok(!Code::Embeddable::equal2(undef, []));
    ok(!Code::Embeddable::equal2(0, undef));
    ok(!Code::Embeddable::equal2(1, undef));
    ok(!Code::Embeddable::equal2("", undef));
    ok(!Code::Embeddable::equal2([], undef));

    # non-refs equal using eq
    ok( Code::Embeddable::equal2(1, 1));
    ok( Code::Embeddable::equal2("", ""));
    ok(!Code::Embeddable::equal2("", 0));
    ok(!Code::Embeddable::equal2("1", "1.0"));

    # non-refs not equal to refs
    ok(!Code::Embeddable::equal2(1, []));
    ok(!Code::Embeddable::equal2(0, []));
    ok(!Code::Embeddable::equal2("", []));
    ok(!Code::Embeddable::equal2([], 1));
    ok(!Code::Embeddable::equal2([], 0));
    ok(!Code::Embeddable::equal2([], ""));

    # refs equal when their refaddr() are equal
    ok(!Code::Embeddable::equal2([], []));
    do {
        my $ref1 = [];
        ok( Code::Embeddable::equal2($ref1, $ref1));
    };
};

done_testing;
