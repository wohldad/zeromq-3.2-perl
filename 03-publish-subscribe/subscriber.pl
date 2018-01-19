#!/usr/bin/perl

use Modern::Perl;

use ZMQ::FFI;
use ZMQ::FFI::Constants qw( ZMQ_SUB );


# Socket to talk to server
say "Collecting updates from weather station…";

my $context = ZMQ::FFI->new;

my $subscriber = $context->socket( ZMQ_SUB );
$subscriber->connect( "tcp://localhost:5556" );

# Subscribe to zipcode, default is NYC, 10001
my $filter = $ARGV[0] // "10001";

# filter is applied on the publish side for version 3.x for tcp/ipc
# for epgm filter is applied at the subscriber side
$subscriber->subscribe( $filter) ;

# Process 100 updates
my $update_nbr = 100;
my $total_temp = 0;

for ( 1 .. $update_nbr ) {

    my $update = $subscriber->recv();

    my ( $zipcode, $temperature, $relhumidity ) = split ' ', $update;

    $total_temp = $total_temp + $temperature;

}

printf "Average temperature for zipcode '%s' was %dF\n",
    $filter, $total_temp / $update_nbr;

