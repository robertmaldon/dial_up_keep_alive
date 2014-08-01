# dial_up_keep_alive

Perl script that periodically ping a few websites in order to keep a dial-up connection alive

## Description

I created this script circa 2004 to help a relative who kept getting disconnected from her dial-up connection because the ISP dropped the connection after 20 minutes of inactivity. This easily happended when, for example, she was composing a long email.

The way this script works is simple: it is invoked periodically and does an HTTP HEAD request on a randomly selected website.

(For those of you who are not old enough to have used a dial-up modem check out the horrible sound
<audio controls>
  <source src="https://raw.githubusercontent.com/robertmaldon/dial_up_keep_alive/master/56k_dial_up_modem.mp3" type="audio/mpeg"/>
</audio>
it made.)

## Installation

This script was used on a Windows pc but should work on any platform.

Instructions for installing on Windows:

1. Install [ActivePerl 5.x](http://www.activestate.com/activeperl)
2. Put the `dial_up_keep_alive.pl` script somewhere on the pc
3. Create a [Windows Scheduled Task](http://support.microsoft.com/kb/308569) that runs the `dial_up_keep_alive.pl` script periodically, say every minute

## Why Perl and not Java?

I originally tried to write the script in Java as a daemon-like task. I'de been doing a lot of Java at the time. However, the JVM behaved like this:

1. The JVM would start and reported the pc's IP address as 127.0.0.1
2. The script would sleep for a while
3. The pc established the dial-up connection
4. The script woke up but still reported the IP address as 127.0.0.1!

Anyway, running Java on the pc was pretty heavyweight.

A Perl script nicely hit the spot!

## License

MIT. See `LICENSE`