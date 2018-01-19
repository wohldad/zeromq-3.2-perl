#!/usr/bin/perl

use Modern::Perl;

use ZMQ::FFI;

my ($major, $minor, $patch) = ZMQ::FFI->new->version;
say "Current 0MQ version is $major.$minor.$patch";