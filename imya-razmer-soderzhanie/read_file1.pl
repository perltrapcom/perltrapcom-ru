#!/usr/bin/perl

# ./read_file1.pl read_file1.pl

use File::Slurp;
use Data::Dumper;

print Dumper(read_file_with_metadata($_)) for @ARGV;

# Получает имя файла, 
# читает файл и его метаданные,
# возвращает ссылку на хеш { filename => '...', content => '...', size => NNN }.
# Если файл не существует, content и size равны undef
sub read_file_with_metadata 
{
    my ($filename) = @_;
    my @stat = stat $filename;

    return {
        filename => $filename, 
        content => eval {scalar read_file($filename)},
        size => $stat[7],
    };
}
