use strict;
use warnings;

use Test::More tests => 4;

use_ok "Sys::MemInfo";

my ($tm, $fm);
ok ($tm = Sys::MemInfo::totalmem (), "Total Memory");
ok ($fm = Sys::MemInfo::freemem (),  "Free  Memory");
ok ($fm <= $tm, "Free ($fm) <= Total ($tm)");