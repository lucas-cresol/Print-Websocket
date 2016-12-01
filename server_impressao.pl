#!/usr/bin/env perl
# https://github.com/lucas-cresol/Print-Websocket
use Data::Dumper;
use Net::WebSocket::Server;

$_PRINTERPORT=@ARGV[0];
$_PORT=@ARGV[1];
$_CHARCUTTER=@ARGV[2];
$_LOGS=@ARGV[3];

#default PORT (porta de comunicacao)
if( not defined $_PORT){
    $PORT=9000;
} else {
    $PORT=$_PORT;
}
#DEFDAULT PRINTER (divice, pode ser LPT1..)
if( not defined $_PORT){
    $PRINTERPORT='/dev/diebold/';
} else {
    $PRINTERPORT=$_PRINTERPORT;
}
#DEFDAULT _CHARCUTTER (caracter de corte automatico, dependendo do modelo de impressora)
if( not defined $_PORT){
    $CHARCUTTER='119';
} else {
    $CHARCUTTER=$_CHARCUTTER;
}
#DEFDAULT _LOGS
if( not defined $_PORT){
    $LOGS='OFF';
} else {
    $LOGS=$_LOGS;
}

 if ($LOGS eq 'ON'){
    print "PRINTER:$PRINTERPORT\n";
    print "CUTTER CHAR:$CHARCUTTER\n";
    print "PORT:$PORT\n";
    print "LOGS:$LOGS\n";
  }
sub reactUtf8 {
  my ($connection, $message) = @_;
    #imprimir
  open (PRINTER, ">",  "$PRINTERPORT");
  print PRINTER "$message\n".chr(27).chr($CHARCUTTER);
  if ($LOGS eq 'ON'){
    print "$message\n";
  }
  close PRINTER;
 
}

my $websocket = Net::WebSocket::Server->new(
  listen => $PORT,
  on_connect =>  sub {
    my ($server, $connection) = @_;
    print("New connection from $connection\n");
#print Dumper $connection;
    foreach my $registeredConnection ($connection->server->connections) {
      if ($connection != $registeredConnection) {
        $registeredConnection->send_utf8("New connection from $connection");
      }
    }
    $connection->on(
      utf8 => \&reactUtf8,
    );
  }
);

print("Listening on port $PORT for clients\n");
$websocket->start;


