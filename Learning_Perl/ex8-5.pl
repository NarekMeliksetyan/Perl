#!/usr/bin/env perl

# Измените программу из предыдущего упражнения так,
# чтобы сразу же за словом, завершающимся буквой a,
# до пяти следующих символов (если они есть в строке)
# сохранялись в отдельной переменной.
# Например, если во входной строке говорится I saw Wilma yesterday,
# в переменной должны сохраняться символы « yest».

use 5.024;

while (<>) {
	chomp;
	if (/(\b\w*a\b)(.{0,5})/s) {
		say "$_:";
		say "'$1' '$2'";
	}
}