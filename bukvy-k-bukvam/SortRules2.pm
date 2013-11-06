package SortRules2;

sub default_cmp($$)
{
    my ($a, $b) = @_;
    return $a cmp $b;
}

sub case_insensitive_cmp($$)
{
    my ($a, $b) = @_;
    return lc($a) cmp lc($b);
}

sub numerical_cmp($$)
{
    my ($a, $b) = @_;
    return $a <=> $b;
}

sub random_cmp
{
    return int(rand(3)) - 1;
}


1;

