package Types::RENEEB;

# ABSTRACT: Several predefined Type::Tiny types

use v5.10;

use strict;
use warnings;

use Moo;

extends qw/Types::OTRS Types::Dist/;

1;

=head1 SYNOPSIS

    package TypesTest;

    use strict;
    use warnings;

    use Moo;
    use Types::RENEEB qw(DistName DistVersion OTRSVersion);

    has distname     => ( is => 'ro', isa => DistName );
    has distversion  => ( is => 'ro', isa => DistVersion );
    has otrs_version => ( is => 'ro', isa => OTRSVersion );

    sub check_otrs_version {
        OTRSVersion->('2.0.0');
    }

    1;

=head1 DESCRIPTION

C<Types::RENEEB> is a collection of types I need very often

=cut
