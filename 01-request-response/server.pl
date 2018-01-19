#!/usr/bin/perl

use Modern::Perl;

use ZMQ::FFI;
use ZMQ::FFI::Constants qw( ZMQ_REP );

use Data::Dumper;


my $context = ZMQ::FFI->new;


my $responder = $context->socket( ZMQ_REP );


$responder->bind("tcp://*:5555");


while ( 1 ) {

    my $rx = $responder->recv;

    say "Got $rx";

    sleep 1;

    $responder->send("World");

}


