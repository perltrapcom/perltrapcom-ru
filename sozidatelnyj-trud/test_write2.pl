#!/usr/bin/perl

# ./test_write2.pl
# ./test_write2.pl /tmp/2013/09/01
# ./test_write2.pl /root

use strict;
use warnings; 

use MkDir2; 

my $dir = $ARGV[0];
MkDir2::mkdir_recursive($dir);
open(my $fh, ">", "$dir/test_file");
print $fh "success\n";
close($fh);

