#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

use_ok 'Types::OTRS';

Types::OTRS->import('OTRSVersion');

my $Version = OTRSVersion();

my @good = qw(2.0.0 31.0.0 13.13.13);
my @bad  = (undef, qw/test 0 2 4.5 2.2.x 2.x/);

for my $good ( @good ) {
    ok $Version->($good);
}

for my $bad ( @bad ) {
    my $error;
    eval { $Version->('test'); 1; } or $error = $@;

    like $error, qr/Value ".*?" did not pass/;
}

done_testing();
