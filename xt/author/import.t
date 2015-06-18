#!perl

use 5.010;
use strict;
use warnings;

package Foo;

our @EXPORT = qw(f1);
our @EXPORT_OK = qw(f2);

# INSERT_BLOCK: lib/Code/Embeddable.pm import

package main;

use Test::Exception;
use Test::More 0.98;

lives_ok { Foo->import };
lives_ok { Foo->import("f1") };
lives_ok { Foo->import("f2") };
dies_ok  { Foo->import("f3") };

done_testing;
