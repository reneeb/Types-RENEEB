package Types::Dist;

# ABSTRACT: Types related to distributions (e.g. distributions on CPAN)

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
            (?:[A-Za-z][A-Za-z0-9]*)
            (?: - [A-Za-z0-9]+ )*
        \z}xms;
    };

declare DistVersion =>
    as Str,
    where {
        $_ =~ m{\A
            v?
            (?:
                [0-9]+
                (?: \. [0-9]+ )*
            )
        \z}xms
    };

1;

=head1 TYPES

=head2 DistName

A name of a distribution

=head2 DistVersion

A version of a distribution

