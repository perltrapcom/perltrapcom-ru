#!/usr/bin/perl

# выполняет внешнюю программу, возвращает ее stdout в виде массива строк
# если программу не удалось выполнить или она закончилась ошибкой -- умирает
sub exec_and_get_output 
{
   my @cmd  = @_;
   my @answer  = `@cmd` or die "Can't exec[@cmd]: $?";
   return @answer;
}

# ok
eval{ print exec_and_get_output(qw!grep -r root /etc/passwd!) };
print $@;

# ok, несуществующая программа
eval{ print exec_and_get_output(qw!abracadabrainnvsiufhwk!) };
print $@;

# ok, ненулевой код завершения
eval{ print exec_and_get_output(qw!false!) };
print $@;

# ??!! почему-то умирает
eval{ print exec_and_get_output(qw!true!) };
print $@;

# ??!! почему-то умирает
eval{ print exec_and_get_output(qw!find . -name zzzzz!) };
print $@;

