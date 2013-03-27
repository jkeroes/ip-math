ip-math
=======

CIDR block math


Install Net::CIDR::Set with your favorite tool. e.g.:

    $ cpanm -S Net::CIDR::Set
    --> Working on Net::CIDR::Set
    Fetching http://search.cpan.org/CPAN/authors/id/A/AN/ANDYA/Net-CIDR-Set-0.11.tar.gz ...     OK
    Configuring Net-CIDR-Set-0.11 ... OK
    Building and testing Net-CIDR-Set-0.11 ... OK
    Successfully installed Net-CIDR-Set-0.11


Copy ip-math.pl to ~/bin, /usr/local/bin, etc.

Usage:

    $ ip-math.pl --help
    ip-math.pl [options]
    
    	CIDRs, ranges, and individual IP's are accepted:
    
    	--add=1.1.1.1/8
    	--remove=1.1.1.1/23,1.2.2.2/15,1.18.18.18/24
    
        Output options:
    
    	--as=string | cidrs | addresses | ranges  [default: string]
    	--as=s      | c     | a         | r
    
    	--help
    
    $ ip-math.pl --add=1.1.1.1/8 --remove=1.1.1.1/23,1.2.2.2/15,1.18.18.18/24 --as=cidr
    1.0.0.0/16
    1.1.2.0/23
    1.1.4.0/22
    1.1.8.0/21
    1.1.16.0/20
    1.1.32.0/19
    1.1.64.0/18
    1.1.128.0/17
    1.4.0.0/14
    1.8.0.0/13
    1.16.0.0/15
    1.18.0.0/20
    1.18.16.0/23
    1.18.19.0/24
    1.18.20.0/22
    1.18.24.0/21
    1.18.32.0/19
    1.18.64.0/18
    1.18.128.0/17
    1.19.0.0/16
    1.20.0.0/14
    1.24.0.0/13
    1.32.0.0/11
    1.64.0.0/10
    1.128.0.0/9
    
    $ ip-math.pl --add=1.1.1.1/8 --remove=1.1.1.1/23,1.2.2.2/15,1.18.18.18/24 --as=range
    1.0.0.0/16
    1.1.2.0-1.1.255.255
    1.4.0.0-1.18.17.255
    1.18.19.0-1.255.255.255
    
    $ ip-math.pl --add=1.1.1.1/8 --remove=1.1.1.1/23,1.2.2.2/15,1.18.18.18/24
    1.0.0.0/16, 1.1.2.0-1.1.255.255, 1.4.0.0-1.18.17.255, 1.18.19.0-1.255.255.255



