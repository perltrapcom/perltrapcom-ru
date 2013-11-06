#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);

sub rpush 
{
    my $arr = shift;
    splice(@$arr, @$arr, 0, @_);
    return scalar @$arr;
}

my $arr11 = [1,2,3,4,5];
my $arr12 = [1,2,3,4,5];
my $arr21 = [];
my $arr22 = [];
my $arr31;
my $arr32;

push @$arr11, 6;
say 'push @$arr11, ... : '.join ", ", @$arr11;
rpush $arr12, 6;
say 'rpush $arr12, ... : '.join ", ", @$arr12;

push @$arr21, 10, 11, 17;
say 'push @$arr21, ... : '.join ", ", @$arr21;
rpush $arr22, 10, 11, 17;
say 'rpush $arr22, ... : '.join ", ", @$arr22;

push @$arr31, 42;
say 'push @$arr31, ... : '.join ", ", @$arr31;
rpush $arr32, 42;
say 'rpush $arr32, ... : '.join ", ", @$arr32;

