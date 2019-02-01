#!/usr/bin/perl

use strict;
use warnings;
use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Text::CSV  1.32;   # We will be using the CSV module (version 1.32 or higher)
                       # to parse each line
use Scalar::Util 'looks_like_number';


require "parse.pl";

our $record_count;
our @violation;
our @location;
our @statistic;
our $answer1 = 0;
our $answer2;
our @value;
our @date;
our @location_name;
my $answer3 = 0;
my $answer4 = 0;
my $display = 0;
my $topNum = 0;
my $z = 0;
my $w = 0;
my $f = 0;
my @murderCities;
my @murderValues;
my $counter = 0;
my $year;
my @sorted_values;
my @sorted_values2;
my @sorted_values3;
my @sorted_values4;
my @sorted_values5;
my $string = 0;

@sorted_values = ();
$answer2 = 12543;

while ($answer2 != 7) {
    
    
 
         if($string == 1){
          do{
             print "\nSelect a year (enter the corresponding number) \n"; 
             print "1.  1998\n";
             print "2.  1999\n";
             print "3.  2000\n";
             print "4.  2001\n";
             print "5.  2002\n";
             print "6.  2003\n";
             print "7.  2004\n";
             print "8.  2005\n";
             print "9.  2006\n";
             print "10. 2007\n";
             print "11. 2008\n";
             print "12. 2009\n";
             print "13. 2010\n";
             print "14. 2011\n";
             print "15. 2012\n";
             print "16. 2013\n";
             print "17. 2014\n";
             print "18. 2015\n";
             print "Enter selection: ";
             $answer3 = <>;
             if( !(looks_like_number($answer3)) ){
                $answer3 = -100;
             }
             if( (grep(/\./, $answer3) ) ){
              $answer3 = 0;
             }
             if($answer3 < 1 || $answer3 > 18) {
              print "INVALID INPUT. PLEASE ENTER A NUMBER FROM THE LIST\n\n";
             }
             $year = 1997 + $answer3;
          }while($answer3 < 1 || $answer3 > 18);
      }


        #-------SOLVING FOR THE CRIME CAPITAL-------

        if ($answer2== 1) {
           for $z (1..$record_count){
                   if (($date[$z] == $year) && ($statistic[$z] eq "Rate per 100,000 population") && ($violation[$z] eq "Total, all violations") && ($location[$z] ne "Canada") && ($location[$z] ne "Yukon") && ($location[$z] ne "Northwest Territories") && ($location[$z] ne "Nunavut") && ($location[$z] ne "British Columbia") && ($location[$z] ne "Alberta") && ($location[$z] ne "Saskatchewan") && ($location[$z] ne "Manitoba") && ($location[$z] ne "Ontario") && ($location[$z] ne "Quebec") && ($location[$z] ne "Newfoundland and Labrador") && ($location[$z] ne "New Brunswick") && ($location[$z] ne "Nova Scotia") && ($location[$z] ne "Prince Edward Island")    ){
                        $murderCities[$counter] = $location[$z];
                        $murderValues[$counter] = $value[$z];
                        $counter++;
                }
           }

           #my @sorted_values;
           @sorted_values = sort{$b <=> $a}@murderValues;
           $counter--;
           for $f (0..$counter) {
                if($sorted_values[0] == $murderValues[$f]) {
                     print "\nThe Crime Capital of Canada for $year was $murderCities[$f]\n\n";
                }
            }

           $counter = 0;
           @sorted_values = ();
           @murderCities = ();
           @murderValues = ();
       
       }
   
     #------SOLVING FOR THE MURDER CAPITAL-------

     elsif ($answer2 == 2) {
     
           
           
                
          
           for $z (1..$record_count){
		            if (($date[$z] == $year) && ($statistic[$z] eq "Rate per 100,000 population") && ($violation[$z] eq "Murder, first degree") && ($location[$z] ne "Canada") && ($location[$z] ne "Yukon") && ($location[$z] ne "Northwest Territories") && ($location[$z] ne "Nunavut") && ($location[$z] ne "British Columbia") && ($location[$z] ne "Alberta") && ($location[$z] ne "Saskatchewan") && ($location[$z] ne "Manitoba") && ($location[$z] ne "Ontario") && ($location[$z] ne "Quebec") && ($location[$z] ne "Newfoundland and Labrador") && ($location[$z] ne "New Brunswick") && ($location[$z] ne "Nova Scotia") && ($location[$z] ne "Prince Edward Island")    ){
                        $murderCities[$counter] = $location[$z];
                        $murderValues[$counter] = $value[$z];
                        $counter++;
                        
                }
           }

           #my @sorted_values2;
           @sorted_values2 = sort{$b <=> $a}@murderValues;
           $counter--;
           for $f (0..$counter) {       
                if($sorted_values2[0] == $murderValues[$f]) {
                     print "\nThe Murder Capital of Canada for $year was $murderCities[$f]\n\n";
                }     
            }
          
           $counter = 0;
           @sorted_values2 = ();
           @murderValues = ();
           @murderCities = ();
       }

        #-------SOLVING FOR THE DRUG CAPITAL--------
       elsif ($answer2 == 3) {
           
          for $z (1..$record_count){
                   if (($date[$z] == $year) && ($statistic[$z] eq "Rate per 100,000 population") && ($violation[$z] eq "Total drug violations") && ($location[$z] ne "Canada") && ($location[$z] ne "Yukon") && ($location[$z] ne "Northwest Territories") && ($location[$z] ne "Nunavut") && ($location[$z] ne "British Columbia") && ($location[$z] ne "Alberta") && ($location[$z] ne "Saskatchewan") && ($location[$z] ne "Manitoba") && ($location[$z] ne "Ontario") && ($location[$z] ne "Quebec") && ($location[$z] ne "Newfoundland and Labrador") && ($location[$z] ne "New Brunswick") && ($location[$z] ne "Nova Scotia") && ($location[$z] ne "Prince Edward Island")    ){
                        $murderCities[$counter] = $location[$z];
                        $murderValues[$counter] = $value[$z];
                        $counter++;

                }
           }

           #my @sorted_values3;
           @sorted_values3 = sort{$b <=> $a}@murderValues;
           $counter--;
           for $f (0..$counter) {
                if($sorted_values3[0] == $murderValues[$f]) {
                     print "\nThe Drug Capital of Canada for $year was $murderCities[$f]\n\n";
                }
            }

           $counter = 0;
           @sorted_values3 = ();
           @murderCities = ();
           @murderValues = ();
       } 

       elsif($answer2 == 4){
         
          for $z (1..$record_count){
                   if (($date[$z] == $year) && ($statistic[$z] eq "Rate per 100,000 population") && ($violation[$z] eq "Total robbery") && ($location[$z] ne "Canada") && ($location[$z] ne "Yukon") && ($location[$z] ne "Northwest Territories") && ($location[$z] ne "Nunavut") && ($location[$z] ne "British Columbia") && ($location[$z] ne "Alberta") && ($location[$z] ne "Saskatchewan") && ($location[$z] ne "Manitoba") && ($location[$z] ne "Ontario") && ($location[$z] ne "Quebec") && ($location[$z] ne "Newfoundland and Labrador") && ($location[$z] ne "New Brunswick") && ($location[$z] ne "Nova Scotia") && ($location[$z] ne "Prince Edward Island")    ){
                        $murderCities[$counter] = $location[$z];
                        $murderValues[$counter] = $value[$z];
                        $counter++;

                }
           }

           #my @sorted_values4;
           @sorted_values4 = sort{$b <=> $a}@murderValues;
           for $f (0..$counter-1) {
                if($sorted_values4[0] == $murderValues[$f]) {
                     print "\nThe Theft Capital of Canada for $year was $murderCities[$f]\n\n";
                }
            }
        
        
           $counter = 0;
           @sorted_values4 = ();
           @murderValues = ();
           @murderCities = ();

       }

       elsif($answer2 == 5){
         
         for $z (1..$record_count){
                   if (($date[$z] == $year) && ($statistic[$z] eq "Rate per 100,000 population") && ($violation[$z] eq "Total forcible confinement or kidnapping") && ($location[$z] ne "Canada") && ($location[$z] ne "Yukon") && ($location[$z] ne "Northwest Territories") && ($location[$z] ne "Nunavut") && ($location[$z] ne "British Columbia") && ($location[$z] ne "Alberta") && ($location[$z] ne "Saskatchewan") && ($location[$z] ne "Manitoba") && ($location[$z] ne "Ontario") && ($location[$z] ne "Quebec") && ($location[$z] ne "Newfoundland and Labrador") && ($location[$z] ne "New Brunswick") && ($location[$z] ne "Nova Scotia") && ($location[$z] ne "Prince Edward Island")    ){
                        $murderCities[$counter] = $location[$z];
                        $murderValues[$counter] = $value[$z];
                        $counter++;

                }
           }

           #my @sorted_values4;
           @sorted_values4 = sort{$b <=> $a}@murderValues;
           for $f (0..$counter-1) {
                if($sorted_values4[0] == $murderValues[$f]) {
                     print "\nThe Kidnapping Capital of Canada for $year was $murderCities[$f]\n\n";
                }
            }
        
        
           $counter = 0;
           @sorted_values4 = ();
           @murderValues = ();
           @murderCities = ();

       } 

       elsif($answer2 == 6){
        
        for $z (1..$record_count){
                   if (($date[$z] == $year) && ($statistic[$z] eq "Rate per 100,000 population") && ($violation[$z] eq "Fraud") && ($location[$z] ne "Canada") && ($location[$z] ne "Yukon") && ($location[$z] ne "Northwest Territories") && ($location[$z] ne "Nunavut") && ($location[$z] ne "British Columbia") && ($location[$z] ne "Alberta") && ($location[$z] ne "Saskatchewan") && ($location[$z] ne "Manitoba") && ($location[$z] ne "Ontario") && ($location[$z] ne "Quebec") && ($location[$z] ne "Newfoundland and Labrador") && ($location[$z] ne "New Brunswick") && ($location[$z] ne "Nova Scotia") && ($location[$z] ne "Prince Edward Island")    ){
                        $murderCities[$counter] = $location[$z];
                        $murderValues[$counter] = $value[$z];
                        $counter++;

                }
           }

           #my @sorted_values4;
           @sorted_values4 = sort{$b <=> $a}@murderValues;
           for $f (0..$counter-1) {
                if($sorted_values4[0] == $murderValues[$f]) {
                     print "\nThe Fraud Capital of Canada for $year was $murderCities[$f]\n\n";
                }
            }
        
        
           $counter = 0;
           @sorted_values4 = ();
           @murderValues = ();
           @murderCities = ();

       }

     do{  
       print "\n-------------------CRIME CAPITALS---------------------\n";
       print "1. Crime Capital of Canada\n2. Murder Capital of Canada\n3. Drug Capital of Canada\n4. Theft Capital of Canada\n5. Kidnapping Capital of Canada\n6. Fraud Capital of Canada\n7. Back\n";
       print "Enter selection: ";
       $answer2 = <>; 
       if(!(looks_like_number($answer2)) ){
        $answer2 =  0;
       }
       if( (grep(/\./, $answer2) ) ){
              $answer2 = 0;
        }
        if($answer2 < 1 || $answer2 > 7){
          print "INVALID INPUT. PLEASE SELECT A NUMBER FROM THE LIST\n";
        }
     }
     while($answer2 < 1 || $answer2 > 7);
     $string = 1;
}
