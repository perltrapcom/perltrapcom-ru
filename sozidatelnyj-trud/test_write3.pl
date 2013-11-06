#!/usr/bin/perl

# ./test_write3.pl /tmp/2013/10
# ./test_write3.pl /tmp/2013/10/01
# ./test_write3.pl /root

use strict;
use warnings; 

use MkDir3; 

my $dir = $ARGV[0];
MkDir3::mkdir_recursive($dir);
open(my $fh, ">", "$dir/01") or die "can't open file, stop";
print $fh "success\n";
close($fh);

