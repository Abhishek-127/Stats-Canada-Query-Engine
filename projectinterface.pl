#!/usr/bin/perl
#
#   Packages and modules
#
use strict;
use warnings;
use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Text::CSV  1.32;   # We will be using the CSV module (version 1.32 or higher)
use Scalar::Util 'looks_like_number';                     # to parse each line


our $answer1 = 0;
our $trendans = 0;
our $answer2 = 0;
our $answer3;
my $answer4 = 0;
my $answer5 = 0;
my $searchCity;
my $display = 0;
our $topNum = 0;

print "\n";
print "\t\t\tWelcome to the Canadian Statistics Query Engine.\n";
print "\t\t\t------------------------------------------------\n";
print "\t\tENSURE THAT YOU HAVE ALL THE REQUIRED FILES IN YOUR DIRECTORY\n";
print "\t\tPLEASE ENSURE THAT THIS PROGRAM IS RUNNING IN FULL SCREEN MODE\n\n";
print "Available Options - Please select the number of your choice.\n";
do {
   print "\n-----------------MAIN MENU--------------------\n";
   print "1. GENERAL INQUIRIES\n2. TOP LISTS\n3. TRENDS\n4. CENSUS STATISTICS\n5. CRIME CAPITALS\n6. QUIT\n";
   print "Enter selection: ";
   $answer1 = <>;
   if( !(looks_like_number($answer1))){
   	$answer1 = 0;

   }
   if( (grep(/\./, $answer1) ) ){
      $answer1 = 0;
   }
   if($answer1 < 1 || $answer1 > 6 ){
   	print "INVALID INPUT. PLEASE ENTER A NUMBER FROM THE LIST\n";
   }
   print "\n";
}
while(($answer1 < 1) ||  ($answer1 > 6));

#print "You selected choice $answer1"; 

while ($answer1 != 6) {
	
	#GENERAL INQUIRIES
	if ($answer1 == 1) {
		do{
		   print "----------------GENERAL INQUIRIES-------------------\n";
		   print "1. Total Crimes\n2. Total Locations\n3. Years Covered\n4. Search for a city\n5. Back\n";
		   print "Enter selection: ";
		   $answer2 = <>;
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
		while($answer2 < 1 || $answer2 > 5);
		if ($answer2 != 5) {            
                    do "general2.pl";
		}
	}

	
	#TOP LISTS
	if ($answer1 == 2) {
		do{
		   print "----------------------TOP LISTS-------------------\n";
		   print "1. Top Crime Cities\n2. Top Crime Types\n3. Safest Cities\n4. Back\n";
		   print "Enter selection: ";
		   $answer3 = <>;

		   if( !(looks_like_number($answer3))){
		   	$answer3 = 0;
		   }
		   if( (grep(/\./, $answer3) ) ){
      		$answer3 = 0;
   		   }
		   if($answer3 < 1 || $answer3 > 4){
		   	print "INVALID INPUT. PLEASE ENTER A NUMBER FROM THE LIST\n\n";
		   }

		}
		while($answer3 < 1 || $answer3 > 4);

		if ($answer3 != 4) {
			
			#TOP CRIME CITIES
			if ($answer3 == 1){
				do{
				   print "\n-----TOP LIST CATEGORIES----\n";
				   print "1. Top 5\n2. Top 10\n3. Top 25\n";
				   print "Enter selection: ";
				   $topNum = <>;
                   if(!(looks_like_number($topNum)) ){
                   	$topNum = 0;
                   }
                   if( (grep(/\./, $topNum) ) ){
      				$topNum = 0;
   				   }
                   if($topNum < 1 || $topNum > 3){
                   	print "INVALID INPUT. PLEASE ENTER A NUMBER FROM THE LIST\n\n";
                   }
			    }
			    while($topNum < 1 || $topNum > 3);
				do "toplist.pl";
			}
			
			#TOP CRIME TYPES
			if ($answer3 == 2){
				do{
				   print "\n-----------TOP LIST CATEGORIES--------------\n";
				   print "1. Top 5\n2. Top 10\n3. Top 25\n";
				   print "Enter selection: ";
				   $topNum = <>;
				   if( !(looks_like_number($topNum))){
				   	$topNum = 0;
				   }
				   if( (grep(/\./, $topNum) ) ){
      				$topNum = 0;
   				   }
				   if($topNum < 1 || $topNum > 5){
				   	print "INVALID INPUT. PLEASE ENTER A NUMBER FROM THE LIST\n\n";
				   }
			    }
			    while($topNum < 1 || $topNum > 3);
				do "toplist.pl";
			}
			
			#SAFEST CRIME CITIES
			if ($answer3 == 3){
				do{
				   print "\n-----TOP LIST CATEGORIES----\n";
				   print "1. Top 5\n2. Top 10\n3. Top 25\n";
				   print "Enter selection: ";
				   $topNum = <>;
				   if( !(looks_like_number($topNum))){
				   	$topNum = 0;
				   }
				   if( (grep(/\./, $topNum) ) ){
      				$topNum = 0;
   				   }
				   if($topNum < 1 || $topNum > 3){
				   	print "INVALID INPUT. PLEASE ENTER A NUMBER FROM THE LIST\n\n";
				   }
			    }
			    while($topNum < 1 || $topNum > 3);
				do "toplist.pl";
			}
		}
	}
	
	#TRENDS
	if ($answer1 == 3) {
		do{
		   print "-----------------------TRENDS---------------------\n";
		   print "1. Changes in Total Canadian crime over the years\n2. Changes in the crime for a city or province over the years\n3. Changes in the statistics for a crime over the years\n4. Back\n";
		   print "Enter selection: ";
		   $trendans = <>;
		   if( !(looks_like_number($trendans))){
		   	$trendans = 0;
		   }
		   if( (grep(/\./, $trendans) ) ){
      		$trendans = 0;
   		   }
		   if($trendans < 1 || $trendans > 4){
		   	print "INVALID INPUT. PLEASE ENTER A NUMBER FROM THE LIST\n\n";
		   }
	    }
	    while($trendans < 1 || $trendans > 4);
           if($trendans != 4) {
		   do "trends.pl";
           }
	}
	
	#MORE INFO
	if ($answer1 == 4) {
		#print "----------------------CENSUS STATISTICS----------------------\n";
		do "census.pl";
	}
	
    if ($answer1 == 5) {
    	#print "-------------------CRIME CAPITALS---------------------\n";
        do "interestingFacts.pl";
    }

	
    do {
    	print "\n-----------------MAIN MENU--------------------\n";
        print "1. GENERAL INQUIRIES\n2. TOP LISTS\n3. TRENDS\n4. CENSUS STATISTICS\n5. CRIME CAPITALS\n6. QUIT\n";
        print "Enter selection: ";
        $answer1 = <>;
        if( !(looks_like_number($answer1))){
   	    	$answer1 = 0;
        }
        if( (grep(/\./, $answer1) ) ){
      		$answer1 = 0;
   		}
        if($answer1 < 1 || $answer1 > 6 ){
   	        print "INVALID INPUT. PLEASE ENTER A NUMBER FROM THE LIST\n";
        }
        print "\n";
    }
    while(($answer1 < 1) ||  ($answer1 > 6));
	
}
print "Bye!\n";

1;


