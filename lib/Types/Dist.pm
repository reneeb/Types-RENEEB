package Types::Dist;

# ABSTRACT: Types related to distributions (e.g. distributions on CPAN)

use v5.10;

use strict;
use warnings;

use Type::Library
   -base,
   -declare => qw( DistName DistVersion DistFQ CPANfile );

use Type::Utils -all;
use Types::Standard -types;

use Module::CPANfile;

our $VERSION = '0.02';

my $distname_re = qr{
    (?:[A-Za-z][A-Za-z0-9]*)
    (?: - [A-Za-z0-9]+ )*
}xms;

my $distversion_re = qr{
    v?
    (?:
        [0-9]+
        (?: \. [0-9]+ )*
    )
}xms;

my $distfq_re = qr{$distname_re-$distversion_re};


declare DistName =>
    as Str,
    where { $_ =~ m{\A$distname_re\z} };

declare DistVersion =>
    as Str,
    where { $_ =~ m{\A$distversion_re\z} };

declare DistFQ =>
    as Str,
    where { $_ =~ m{\A$distfq_re\z} };

class_type CPANfile, { class => 'Module::CPANfile' };

coerce CPANfile,
    from Str, via { Module::CPANfile->load( $_ ) }
;

1;

=head1 TYPES

=head2 DistName

A name of a distribution

=head2 DistVersion

A version of a distribution

=head2 DistFQ

I<DistName>-I<DistFQ>

