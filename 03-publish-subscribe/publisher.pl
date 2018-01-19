#!/usr/bin/perl

use Modern::Perl;

use ZMQ::FFI;
use ZMQ::FFI::Constants qw( ZMQ_PUB );


my $context   = ZMQ::FFI->new;

my $publisher = $context->socket( ZMQ_PUB );
$publisher->bind( "tcp://*:5556" );


while (1) {

    my $zipcode     = rand( 100_000 );
    my $temperature = rand( 215 ) - 80;
    my $relhumidity = rand( 50 )  + 10;

    my $update = sprintf( '%d %d %d', $zipcode, $temperature, $relhumidity );

    $publisher->send( $update );

}

