#!/usr/bin/perl
##   Packages and modules
#
use strict;
use warnings;
use feature qw/say/;
use autodie;
use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used

#use List::MoreUtils
#use List::MoreUtils qw(uniq);
#use Data::Dumper qw(Dumper);

require "parse.pl";

our $record_count;
our $num_location;
our @crimes;
our @location_name;
our @date;
our @location;
our @violation;
our $answer2;
my $k = 0;
my $totalCities = 0;
my $totalCities2 = 0;
my @cityList;
my $z = 0;
my $totalCrimes = 0;
my $y = 0;
my $totalYears = 0;
my @yearList;
my $x = 0;
my $t = 0;



while ($answer2 != 5) {

#---------------------------------------------------------
# GETTING TOTAL LOCATIONS

    if ($answer2 == 2){

	#print "City List: @cityList\n";
	$totalCities2 = $totalCities-2;
        print "\n-------------------\n";
	print "TOTAL LOCATIONS: $num_location\n";
        print "-------------------\n";
        print "\n";                
    }

#---------------------------------------------------------
# GETTING TOTAL CRIMES

    if ($answer2 == 1){
	for $z (0..$record_count){
    		if (($violation[$z] ne $violation[$z-1]) && ($z != 0) && ($location[$z] eq "Canada")) {
                        #print $violation[$z];
         		#print "\n";
         		$totalCrimes++;    
		}
	}
       
	print "\n------------------\n";
        print "TOTAL CRIMES: $totalCrimes\n";
        print "------------------\n";
        print "\n";
    }
    $totalCrimes = 0;

#---------------------------------------------------------
# GETTING TOTAL YEARS

    if ($answer2 == 3){

        sub uniq {
             my %seen;
             grep !$seen{$_}++, @_;
        }

        my @uniqueYears = uniq(@date);        
        my $totalYears = scalar @uniqueYears;
        $totalYears = $totalYears - 2;
        
        

        print "\n------------------------\n";
	    print "TOTAL YEARS COVERED: $totalYears\n";
        print "Year Range: $uniqueYears[1] - $uniqueYears[$totalYears+1]\n";
        print "------------------------\n";
        print "\n";
    }

#---------------------------------------------------------
# SEARCHING FOR A LOCATION          

    if ($answer2 == 4){
	print "\nWhat location are you searching for? ";
        print "\n";
	my $searchCity;
        print "Enter city/province name: ";
        $searchCity=<>;
	chomp($searchCity);
	print "Searching for: $searchCity ....\n";
        print "\n";
	my $o = 0;

	for $o (0..$num_location){
    		if ((grep (/\b$searchCity\b/i,$location_name[$o]))) {
                        print "\n--------- FOUND ---------\n";
        		print "$location_name[$o] is represented in the data.\n";
                        print "\n";
        		last;
    		}
    		if (!(grep (/\b $searchCity \b/i,$location_name[$o])) && ($o == 47) ) {
                        print "\n------- NOT FOUND -------\n";
        		print "$searchCity is not represented in the data.\n";
                        print "\n";
        		last;
    		}
	}
    }

#---------------------------------------------------------
 # REPEAT LOOP?   

    do{   
       print "----------------------GENERAL INQUIRIES------------------------\n";
       print "1. Total Crimes\n2. Total Locations\n3. Years Covered\n4. Search for a city\n5. Back\n";
       print "Enter selection: ";
       $answer2 = <STDIN>;
       if( !(looks_like_number($answer2))){
            $answer2 = 0;
       }
       if( (grep(/\./, $answer2) ) ){
            $answer2 = 0;
       }
       if($answer2 < 1 || $answer2 > 5){
            print "INVALID INPUT. PLEASE ENTER A NUMBER FROM THE LIST\n\n";
       }
    }
    while($answer2 < 1 || $answer2 > 5)
}
