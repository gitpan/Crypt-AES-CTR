#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 3;


use_ok( 'Crypt::AES::CTR' );



my $string = 'test string';
my $pass = 'pass';
my $enc = Crypt::AES::CTR::encrypt($string, $pass, 256);

cmp_ok(length($enc), '>', 0, 'Encryption test');

my $dec = Crypt::AES::CTR::decrypt($enc, $pass, 256);

is( $dec, $string, 'Decryption match' );