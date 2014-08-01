#!/usr/bin/perl -w
# A small program that keeps alive an internet dialup connection
# by periodically polling some well-known HTTP connections.

use strict;

use Socket 'inet_ntoa';
use Sys::Hostname 'hostname';
use LWP::Simple;

# Check if we are connected to the internet before polling.
# We do this by waiting for the IP address to change from
# 127.0.0.1 to something else.

print "Checking for internet connection...\n";

my $ip = inet_ntoa(scalar gethostbyname(hostname() || 'localhost'));
if ( $ip eq "127.0.0.1" ) {
    die( "Not connected\n" );
}

print "Connected...\n";

my @siteList = ( "http://www.yahoo.com/", "http://www.smh.com.au/", "http://money.cnn.com/", "http://www.microsoft.com/", "http://www.theserverside.com/" );

# Select a website at random.
my $site = $siteList[ int( rand( $#siteList + 1 ) ) ];

print "HEADing website [$site]\n";

my $content = head( $site );
if ($content) {
    print "[" . localtime() . "] $site is UP\n";
}
else {
    print "[" . localtime() . "] $site is DOWN\n";
}
