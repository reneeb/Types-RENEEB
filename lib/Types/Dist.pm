package Types::Dist;

use v5.10;

use strict;
use warnings;

use Type::Library
   -base,
   -declare => qw( DistName DistVersion );

use Type::Utils -all;
use Types::Standard -types;

our $VERSION = '0.01';

declare DistName =>
    as Str,
    where {
        $_ =~ m{\A
            ([A-Za-z][A-Za-z0-9]*)
            (?: - [A-Za-z0-9]+ )*
        \z}
    };

declare DistVersion =>
    as Str,
    where {
        $_ =~ m{\A
            v?
            (?:
                [0-9]+
                (?: \. [0-9] ){0,2}
            )
        \z}xms
    };

1;
