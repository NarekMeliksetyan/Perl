#!/usr/bin/env perl

use 5.016;
use warnings;
no warnings 'experimental';

use utf8;
use DDP;
use AnyEvent::Socket;
use AnyEvent::Handle;
use VK;

my $cv = AE::cv;
our $info;

say "Enter user id:";
chomp (my $id = <>);

enriche($id, sub {
    my $data = get_data($info);
    p $data;
    die "\n";
});

sub enriche {
    my ($user_id, $cb) = @_;

    my $API = VK->new(access_token => "74c198fb74c198fb74c198fb75749e166a774c174c198fb2ecc459d39284f0741ddc759");
    $API->users_get($user_id, sub {
        my $inf0 = shift;
        $info = shift @$inf0;
        $cb->($id);
    });
}

$cv->recv;

sub get_data {
    my $href = shift;
    my %data;

    $data{name} = "$href->{first_name} $href->{last_name}";
    $data{bdate} = $href->{bdate} if $href->{bdate};
    $data{sex} = "female" if $href->{sex} == 1;
    $data{sex} = "male" if $href->{sex} == 2;
    $data{online} = $href->{online};
    $data{id} = $href->{id};
    $data{city} = $href->{city}->{title} if $href->{city}->{title};
    $data{home_town} = $href->{home_town} if $href->{home_town};
    $data{status} = $href->{status} if $href->{status};
    $data{relation} = $href->{relation} if $href->{relation};
    $data{universities} = $href->{universities} if $href->{universities};
    $data{photo} = $href->{photo_max_orig};

    return \%data;
}
