package Types::RENEEB;

# ABSTRACT: Several predefined Type::Tiny types

use v5.10;

use strict;
use warnings;

use parent 'Exporter';

use Module::Runtime qw(use_module);

our $VERSION = '0.01';

my @types;

for my $mod ( qw/Types::OTRS Types::Dist/ ) {
    use_module $mod;
    my @mod_types = $mod->type_names;
    $mod->import( @mod_types );
    push @types, @mod_types;
}

our @EXPORT_OK = @types;

1;

=head1 SYNOPSIS

    package TypesTest;

    use strict;
    use warnings;

    use Moo;
    use Types::RENEEB qw(
        DistName DistVersion
        OTRSVersion OTRSVersionWildcard
    );

    has distname     => ( is => 'ro', isa => DistName );
    has distversion  => ( is => 'ro', isa => DistVersion );
    has otrs_version => ( is => 'ro', isa => OTRSVersion );

    sub check_otrs_version {
        OTRSVersion->('2.0.0');
    }

    sub check_otrs_version {
        OTRSVersion->('2.0.x');
    }

    1;

=head1 DESCRIPTION

C<Types::RENEEB> is a collection of types I need very often

=cut
