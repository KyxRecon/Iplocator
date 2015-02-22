#!/usr/bin/perl
# Ip Geolocation 
#By Alexcerus
# Demo : https://www.youtube.com/watch?v=0Eq3d10LQ8c
#
# API documentation - http://ip-api.com/docs/
# you can see you external ip using this Bash script :
# read COUNTRY IP <<< $(wget -qO- http://ip-api.com/line/?fields=countryCode,query); echo $IP $COUNTRY
# Now let's start :

use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;
  
 
print color 'bold bright_yellow';
 
print q{

        ~o88ooooooooooooo88o~
   ouooooo,~oo         oo~,ooooouo
   8     ~88888.     ,88888~     8
   8      go~~~os   go~~~os      8
   8    ,8`     '8_8`     '8.    8
   8    8`   _   '8`   _   '8    8
   8    8   !@!   8   !@!   8    8
   8    8i       /8\       i8    8
   8     8s     g8 8s     s8     8
   8      dooooo`8_8'ooooob      8
   8     d!      'V`      !b     8
   8     8        ~        8     8
   8     8                 8     8	
   8   ] 8                 8 [   8 
   8 [ ] 8                 8 [ ] 8
   8 [ ] !8               8| [ ] 8
   8 [ ]s88b-oo- xxx -oo-d88s[ ] 8
   8 [,88  8i'`   ~   '`i8  88.] 8
   8 88`   88s'88` '88`gf8   '88 8
   888   ,g8s/8. ooo ,8\g8s.   888
   88`  i888888fo_X_of888888i  '88
   V    YY'`~'`  ~~~  '` ~ YY    V
        ""                 ""

Ip Geolocation Tool  
By : Alexcerus-HR 

------------------------------------
};
 
print color 'reset';
@iphost=$ARGV[0] || die "Usage : ./Iplocation.pl [host] [ip] [domain] \n\nEx:  ./Iplocation.pl  www.google.com \n     ./Iplocation.pl  216.58.210.206\n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);
# Json API Response :
# A successful request will return, by default, the following:
#{
#    "status": "success",
#    "country": "COUNTRY",
#    "countryCode": "COUNTRY CODE",
#    "region": "REGION CODE",
#    "regionName": "REGION NAME",
#    "city": "CITY",
#    "zip": "ZIP CODE",
#    "lat": LATITUDE,
#    "lon": LONGITUDE,
#    "timezone": "TIME ZONE",
#    "isp": "ISP NAME",
#    "org": "ORGANIZATION NAME",
#    "as": "AS NUMBER / NAME",
#   "query": "IP ADDRESS USED FOR QUERY"
# }
# INFOS OF JSON API ...
 
print "  [!] IP: ", $info->{'query'}, "\n";
print "------------------------------------\n"; 
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] ISP: ", $info->{'isp'}, "\n";
print "  [+] Country: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [+] City: ", $info->{'city'}, "\n";
print "  [+] Region: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [+] Geo: ", "Lat: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  [+] Geo: ", "Latitude: " , $info->{'lat'}, " - Long: ", $info->{'lat'}, "\n";
print "  [+] Time: ", "timezone: " , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "  [+] As number/name: ", "as: " , $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] Country code: ", $info->{'countryCode'}, "\n"; 
print "  [+] Status: ", $info->{'status'}, "\n"; 
print "\n";
# EOF