#!/usr/bin/env perl

# Напишите программу, которая читает список строковых значений
# (из разных строк) до конца входных данных.
# Затем программа выводит прочитанные строки в «ASCII-алфавитном» порядке

use 5.024;

chomp(my @lines = <>);
my @sorted = sort @lines;
say @sorted;