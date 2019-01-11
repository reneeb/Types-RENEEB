#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

use_ok 'Types::OTRS';

Types::OTRS->import('OTRSVersion');

my $Version = OTRSVersion;

ok $Version->('2.0.0');

done_testing();
