package MkDir;

use strict;
use warnings;

=head1 NAME

MkDir -- рекурсивное создание каталогов

=head1 SYNOPSIS

    use MkDir;
    MkDir::mkdir_recursive("test/a");
    MkDir::mkdir_recursive("/tmp/test/b");

=head1 DESCRIPTION

Модуль предоставляет функцию mkdir_recursive для рекурсивного создания каталогов.

Модуль предназначен для Unix-подобных систем с разделителем в именах каталогов "/" и корневым каталогом /.

=cut


sub mkdir_recursive
{
    my $path = shift or die "empty path, stop";

    my @parts = split "/", $path;

    my $dir = shift @parts || "/";
    mkdir $dir;
    for my $d (@parts){
        $dir .= "/$d";
        mkdir $dir;
    }
}

1;
