package Types::RENEEB;

use v5.10;

use strict;
use warnings;

use Moo;

extends 'Types::OTRS';

use Type::Library
   -base,
   -declare => qw( ISODateTime AddressType2Code CountryCode );

use Type::Utils -all;
use Types::Standard -types;

our $VERSION = 0.02;

use DateTime;

declare ISODateTime =>
    as Str,
    where {
        ($_ =~ m{\A-?[0-9]{4,}-[0-9]{2}-[0-9]{2}T[0-2][0-9]:[0-5][0-9]:[0-5][0-9](?:Z|[-+]?[0-2][0-9]:[0-5][0-9])?\z}) &&
        (validate_datetime($_))
    };



1;
