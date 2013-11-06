#!/usr/bin/perl

# ./test_write.pl
# ./test_write.pl /tmp/2013/09/01
# ./test_write.pl /root

use strict;
use warnings; 

use MkDir; 

my $dir = $ARGV[0];
MkDir::mkdir_recursive($dir);
open(my $fh, ">", "$dir/test_file");
print $fh "success\n";
close($fh);

