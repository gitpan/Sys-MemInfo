package Sys::MemInfo;

use strict;
use warnings;

require Exporter;
require DynaLoader;

our @ISA = qw(Exporter DynaLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
our @EXPORT = qw(
);
our $VERSION = 0.02;
bootstrap Sys::MemInfo $VERSION;

=pod

Sys::MemInfo - Memory informations

=head1 SYNOPSIS

  use Sys::MemInfo qw(totalmem freemem);

  print "total memory: ".(&totalmem / 1024)."\n";
  print "free memory:  ".(&freemem / 1024)."\n";

=head1 DESCRIPTION

Sys::MemInfo return the total amount of free and used physical memory in bytes in totalmem and freemem variables.

This module has been tested on Linux, OpenUnix, AIX5, OpenBSD and HPUX11.

It should work on Solaris and others *bsd systems like FreeBSD and NetBSD.

=head1 AUTHOR

Sylvain Cresto E<lt>scresto@gmail.comE<gt>

=head1 BUGS

Please send bug-reports to scresto@gmail.com

=head1 LICENCE

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation; either version 2.1 of the
License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
USA

=head1 COPYRIGHT

Copyright (C) 2005 - Sylvain Cresto

=cut

1;
