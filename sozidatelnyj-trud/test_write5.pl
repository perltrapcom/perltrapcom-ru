#!/usr/bin/perl

# OK
# ./test_write5.pl /tmp/2013/12
# ??!! Can't create dir /rooooot: No such file or directory
# ./test_write5.pl /rooooot

use strict;
use warnings; 

use MkDir5; 

my $dir = $ARGV[0];
MkDir5::mkdir_recursive($dir);
open(my $fh, ">", "$dir/01") or die "can't open file, stop";
print $fh "success\n";
close($fh);

