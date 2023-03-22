[![Kwalitee status](https://cpants.cpanauthors.org/dist/Types-RENEEB.png)](https://cpants.cpanauthors.org/dist/Types-RENEEB)
[![GitHub issues](https://img.shields.io/github/issues/reneeb/Types-RENEEB.svg)](https://github.com/reneeb/Types-RENEEB/issues)
[![CPAN Cover Status](https://cpancoverbadge.perl-services.de/Types-RENEEB-0.10)](https://cpancoverbadge.perl-services.de/Types-RENEEB-0.10)
[![Cpan license](https://img.shields.io/cpan/l/Types-RENEEB.svg)](https://metacpan.org/release/Types-RENEEB)

# NAME

Types::RENEEB - Several predefined Type::Tiny types

# VERSION

version 0.10

# SYNOPSIS

```perl
package TypesTest;

use strict;
use warnings;

use Moo;
use Types::RENEEB qw(
    DistName DistVersion
    OPMVersion OPMVersionWildcard
);

has distname     => ( is => 'ro', isa => DistName );
has distversion  => ( is => 'ro', isa => DistVersion );
has opm_version => ( is => 'ro', isa => OPMVersion );

sub check_opm_version {
    OPMVersion->('2.0.0');
}

sub check_opm_version {
    OPMVersion->('2.0.x');
}

1;
```

# DESCRIPTION

`Types::RENEEB` is a collection of types I need very often

# MODULES

These `Types::` modules are shipped in this distribution:

- [Types::Dist](https://metacpan.org/pod/Types%3A%3ADist)
- [Types::OPM](https://metacpan.org/pod/Types%3A%3AOPM)

`Types::RENEEB` inherits the types of the mentioned modules.

## Types::Dist

### DistFQ

_DistName_-_DistVersion_

```perl
package MyClass;

use Moo;
use Types::Dist qw(DistName);

has dist => ( is => 'ro', isa => DistName );

1;
```

And then use your class:

```perl
my $object   = MyClass->new( dist => 'Types-RENEEB-0.09' );
my $object   = MyClass->new( dist => '0.09' );         # fails
my $object   = MyClass->new( dist => 'Types-RENEEB' ); # fails
```

### DistName

A name of a distribution

```perl
my $object   = MyClass->new( dist => 'Types-RENEEB' ); # ok
```

### DistVersion

A version of a distribution

```perl
my $object   = MyClass->new( dist => '0.09' ); # ok
```

### CPANfile

An instance of [Module::CPANfile](https://metacpan.org/pod/Module%3A%3ACPANfile)

```perl
package MyClass;

use Moo;
use Types::Dist qw(CPANfile);

has prereqs => ( is => 'ro', isa => CPANfile, coerce => 1 );

1;
```

And then use your class:

```perl
my $object   = MyClass->new( prereqs => '/path/to/cpanfile' );
my @features = $object->prereqs->features; # call features method from Module::CPANfile
```

## Types::OPM

### OPMVersion

An OPM version looks like 2.4.5 or 6.0.1.

### OPMVersionWildcard

An OPM version with wildcard as used in Addons. To define a version of the OPM framework
that is needed to install the addon, the developer can use 'x' as a wildcard.

E.g. Addons for OPM 6.x can be installed on any OPM 6 installation, whilst addons that
define 2.4.x as the framework version can only installed on any OPM 2.4 installation, but
not on OPM 2.3 installation.

### OPMFile

An object of [OPM::Parser](https://metacpan.org/pod/OPM%3A%3AParser).

It checks if the file exists and can be parsed without an error.

### COERCIONS

#### OPMFile

- From String to OPM::Parser

    When a string is given, it is coerced into an [OPM::Parser](https://metacpan.org/pod/OPM%3A%3AParser) object.



# Development

The distribution is contained in a Git repository, so simply clone the
repository

```
$ git clone git://github.com/reneeb/Types-RENEEB.git
```

and change into the newly-created directory.

```
$ cd Types-RENEEB
```

The project uses [`Dist::Zilla`](https://metacpan.org/pod/Dist::Zilla) to
build the distribution, hence this will need to be installed before
continuing:

```
$ cpanm Dist::Zilla
```

To install the required prequisite packages, run the following set of
commands:

```
$ dzil authordeps --missing | cpanm
$ dzil listdeps --author --missing | cpanm
```

The distribution can be tested like so:

```
$ dzil test
```

To run the full set of tests (including author and release-process tests),
add the `--author` and `--release` options:

```
$ dzil test --author --release
```

# AUTHOR

Renee Baecker <reneeb@cpan.org>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2019 by Renee Baecker.

This is free software, licensed under:

```
The Artistic License 2.0 (GPL Compatible)
```
