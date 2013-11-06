#!/usr/bin/perl

# ./test_write4_parallel.pl |grep fail |wc -l 

use strict;
use warnings; 

use MkDir4; 

for my $i (0 .. 1000) { 
    my $path = "/tmp/perltrap.com/dir_".int(rand(100000)); 
    if ( fork() ) {
        eval{ MkDir4::mkdir_recursive($path)};
        print "$i fail\n" if $@; 
        wait();
    } else { 
        eval{MkDir4::mkdir_recursive($path)}; 
        print "$i fail\n" if $@; 
        exit;
    }  
}

