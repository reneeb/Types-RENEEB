package Types::OTRS;

use v5.10;

use strict;
use warnings;

use Type::Library
   -base,
   -declare => qw(OTRSVersion OTRSVersionWildcard);

use Type::Utils -all;
use Types::Standard -types;

our $VERSION = 0.01;

declare OTRSVersion =>
    as Str,
    where {
        ($_ =~ m{ \A (?: [0-9]+ \. ){2} (?: [0-9]+ ) \z }xms;
    };

declare OTRSVersionWildcard =>
    as Str,
    where {
        ($_ =~ m{ \A (?: [0-9]+ \. ){1,2} (?: [0-9]+ | x ) \z }xms;
    };

1;
