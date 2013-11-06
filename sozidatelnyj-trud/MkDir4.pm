package MkDir4;

use strict;
use warnings;

=head1 NAME

MkDir4 -- рекурсивное создание каталогов

=head1 SYNOPSIS

    use MkDir4;
    MkDir4::mkdir_recursive("test/a");
    MkDir4::mkdir_recursive("/tmp/test/b");

=head1 DESCRIPTION

Модуль предоставляет функцию mkdir_recursive для рекурсивного создания каталогов.

Модуль предназначен для Unix-подобных систем с разделителем в именах каталогов "/" и корневым каталогом /.

=cut


sub _mkdir
{
    my ($dir) = @_;

    unless (-d $dir){
        mkdir $dir or die "can't create dir $dir: $!";
    }
}


sub mkdir_recursive
{
    my $path = shift or die;

    my @parts = split "/", $path;

    my $dir = shift @parts;
    _mkdir $dir unless $dir eq '';
    for my $d (@parts){
        $dir .= "/$d";
        _mkdir $dir;
    }
}


1;
