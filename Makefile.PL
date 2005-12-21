use 5.006;
use ExtUtils::MakeMaker qw(prompt WriteMakefile);
use File::Copy 'copy';

my $libs = '';
my $define = '';

for ($^O) {
  if (/svr/) {
    copy ('arch/sco.xs', 'MemInfo.xs');
  } elsif (/aix/) {
    copy ('arch/aix.xs', 'MemInfo.xs');
    $libs = '-Iperfstat';
  } elsif (/linux/) {
    copy ('arch/generic_unix.xs', 'MemInfo.xs');
  } elsif (/solaris/) {
    copy ('arch/generic_unix.xs', 'MemInfo.xs');
  } elsif (/bsd/) {
    copy ('arch/bsd.xs', 'MemInfo.xs');
  } elsif (/hpux/) {
    copy ('arch/hpux.xs', 'MemInfo.xs');
    $define ='-D_XOPEN_SOURCE_EXTENDED';
  } elsif (/dec_osf/) {
    copy ('arch/tru64.xs', 'MemInfo.xs');
    $libs='-lmach';
  } elsif (/MSWin32/) {
    copy('arch/win32.xs', 'MemInfo.xs');
    $libs='-lpsapi';
  } else {
    die "unsupported OS: $_\n";
  }
}


WriteMakefile(
  'NAME'         => 'Sys::MemInfo',
  'VERSION_FROM' => 'MemInfo.pm', # finds $VERSION
  'DEFINE'       => $define,
  'NORECURS'     => 1,
  'XSOPT'        => '-noprototypes',
  'XS'           => { 'MemInfo.xs'  => 'MemInfo.c', },
  clean => { 'FILES' => 'MemInfo.xs', },
  'LIBS'         => $libs,

  ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
    (ABSTRACT_FROM => 'MemInfo.pm', # retrieve abstract from module
    'AUTHOR'       => 'Sylvain CRESTO <scresto@gmail.com>') : ()),
);
