#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

use Acme::Ikamusume;
use Encode;

my $text = shift @ARGV or die "not passed text";
print encode_utf8(Acme::Ikamusume->geso(decode_utf8($text)));
