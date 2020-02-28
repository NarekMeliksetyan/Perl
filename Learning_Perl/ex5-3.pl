#!/usr/bin/env perl


# Измените предыдущую программу так, чтобы пользователь мог
# выбрать ширину столбца. Например, при вводе значений
# 30,hello,goodbye (в отдельных строках)
# текст должен печататься до 30 столбца.
# Чтобы задание стало более интересным,
# увеличивайте длину линейки при больших введенных значениях.

use 5.024;

print "Enter column width: ";
chomp (my $width = <>);
say "Enter your text";
chomp (my @lines = <>);

say "1234567890" x (($width + 9)/10);
for (@lines) {
	printf "%${width}s\n", $_;
}
