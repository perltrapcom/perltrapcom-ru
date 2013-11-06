#!/usr/bin/perl

use SortRules;

my $rule = \&SortRules::default_cmp;
my $opt = $ARGV[0] && $ARGV[0] =~ /^-/ ? shift @ARGV : '';
if ($opt eq '-i'){
    $rule = \&SortRules::case_insensitive_cmp;
} elsif ($opt eq '-n'){
    $rule = \&SortRules::numerical_cmp;
} elsif ($opt eq '-r'){
    $rule = \&SortRules::random_cmp;
}

my @lines = <>;
print sort $rule @lines;

