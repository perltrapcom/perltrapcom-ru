package MkDir2;

use strict;
use warnings;

=head1 NAME

MkDir2 -- рекурсивное создание каталогов

=head1 SYNOPSIS

    use MkDir2;
    MkDir2::mkdir_recursive("test/a");
    MkDir2::mkdir_recursive("/tmp/test/b");

=head1 DESCRIPTION

Модуль предоставляет функцию mkdir_recursive для рекурсивного создания каталогов.

Модуль предназначен для Unix-подобных систем с разделителем в именах каталогов "/" и корневым каталогом /.

=cut


sub _mkdir
{
    mkdir $_[0] or die "can't create dir $_[0]: $!";
}


sub mkdir_recursive
{
    my $path = shift or die;

    my @parts = split "/", $path;

    my $dir = shift @parts || "/";
    _mkdir $dir;
    for my $d (@parts){
        $dir .= "/$d";
        _mkdir $dir;
    }
}


1;
