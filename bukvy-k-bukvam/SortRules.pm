package SortRules;

sub default_cmp
{
    return $a cmp $b;
}

sub case_insensitive_cmp
{
    return lc($a) cmp lc($b);
}

sub numerical_cmp
{
    return $a <=> $b;
}

sub random_cmp
{
    return int(rand(3)) - 1;
}

1;
