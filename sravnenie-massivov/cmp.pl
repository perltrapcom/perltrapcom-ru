use strict;
use warnings;

my @array1 = qw(11 22 33);
my @array2 = ('11', "22", 33);

if ( join '*', @array1 eq join '*', @array2 ) {
    print '@array1 eq @array2';
} else {
    print '@array1 not eq @array2';
}

