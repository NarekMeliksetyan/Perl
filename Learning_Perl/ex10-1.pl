#!/usr/bin/env perl

# Напишите программу, которая многократно предлагает пользователю
# угадать число от 1 до 100, пока тот не введет правильное число.
# Число должно выбираться случайным образом по волшебной формуле
# int(1+rand 100). Если пользователь вводит неправильное число,
# программа должна выдавать подсказки типа «Too high» или «Too low».
# Если пользователь вводит слово quit или exit, или же пустую строку,
# программа завершает работу. Конечно, если пользователь угадал
# правильно, программа тоже должна завершаться!

use 5.018;

my $rand = int(1 + rand 100);
say "Try to guess my number";
while (1) {
    print ">> ";
    chomp (my $num = <>);
    if ($num == $rand) {
        say "You're right!";
        last;
    } elsif ($num > $rand) {
        say "Too high";
    } elsif ($num < $rand and $num > 0) {
        say "Too low";
    } else {
        say "So sad. It was $rand.";
        last;
    }
}
