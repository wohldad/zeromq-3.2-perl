#!/usr/bin/perl

use Modern::Perl;

use ZMQ::FFI;
use ZMQ::FFI::Constants qw( ZMQ_REQ );

use Data::Dumper;


say "Connecting to server...";

my $context = ZMQ::FFI->new;

my $requestor = $context->socket(ZMQ_REQ);
$requestor->connect("tcp://localhost:5555");


foreach my $request_nbr ( 0..9 ) {

    say "Sending Hello $request_nbr…";

    $requestor->send("Hello");

    my $rx = $requestor->recv();

    say "Received: $rx";

}





