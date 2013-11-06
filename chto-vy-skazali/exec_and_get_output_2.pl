#!/usr/bin/perl

# выполняет внешнюю программу, возвращает ее stdout в виде массива строк или одной строки в зависимости от контекста вызова.
# Если программу не удалось выполнить или она закончилась ошибкой -- умирает
sub exec_and_get_output 
{
   my @cmd  = @_;

   open( my $FH_OUT, '-|', @cmd ) or die "Can't exec[@cmd]: $? $!";
   my @answer = <$FH_OUT>;

   if (wantarray) {
       return @answer;
   } else {
       return join '', @answer;
   }
}

# ok
eval{ print exec_and_get_output(qw!grep -r root /etc/passwd!) };
print $@;

#ok, несуществующая программа
eval{ print exec_and_get_output(qw!abracadabrainnvsiufhwk!) };
print $@;

#ok, нет флага исполнимости
eval{ print exec_and_get_output(qw!/etc/passwd!) };
print $@;

# ??!! почему не умирает?
eval{ print exec_and_get_output(qw!false!) };
print $@;

# ok
eval{ print exec_and_get_output(qw!true!) };
print $@;

# ok
eval{ print exec_and_get_output(qw!find . -name zzzzz!) };
print $@;

