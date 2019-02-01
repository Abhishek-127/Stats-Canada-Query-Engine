#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;
use autodie;
use warnings;
use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Scalar::Util 'looks_like_number';

require "parse.pl";

my $match = "Total";
our $record_count;
our $num_location;
our @location_name;
our @date;
our @location;
our @violation;
our @statistic;
our @vector;
our @coordinate;
our @value;
my @searched_crimes;
my @unsorted_values;
my $number = 0;
our $answer3;
our $topNum;


#TOP CRIMES
my $top_Cnum;
my $index;
my $choose_year;
my $choose_place;
my $year1;
my $sel_year;

if($answer3 == 2) {
   if ($topNum == 1) {
      $top_Cnum = 5;
   }
   if ($topNum == 2) {
      $top_Cnum = 10;
   }
   if ($topNum == 3) {
      $top_Cnum = 25;
   }

   do{
      print "\n-----Select the year you wish to view stats for-----\n";
      for my $i(1..18) {
         $year1 = $i + 1997;
         if($i > 0 && $i < 10) {
            print "$i.  $year1\n";
         }else{
            print "$i. $year1\n";
         }
      }
      print "Enter selection: ";
      $choose_year = <>;
      if(!(looks_like_number($choose_year)) ){
         $choose_year = 0;
      }
      if( (grep(/\./, $choose_year) ) ){
         $choose_year = 0;
      }
      if(($choose_year < 1) || ($choose_year > 18)) {
         print "YOU HAVE SELECTED AN INVALID YEAR. PLEASE SELECT A YEAR FROM THE LIST.\n";
      }
   }
   while(($choose_year < 1) || ($choose_year > 18));
   $sel_year = $choose_year + 1997;

   do{
      print "\n-----Select the location you wish to view stats for-----\n";
      for my $i(0..$num_location) {
         if ($i != $num_location) {
            print $i+1, ". $location_name[$i]\n";
         }
      }
      print "Enter selection: ";
      $choose_place = <>;
      if(!(looks_like_number($choose_place))){
         $choose_place = 0;
      }
      if( (grep(/\./, $choose_place) ) ){
         $choose_place = 0;
      }
      if(($choose_place < 1) || ($choose_place > $num_location)) {
         print "YOU HAVE SELECTED AN INVALID LOCATION. PLEASE SELECTION A LOCATION FROM THE LIST.\n";
      }
   }
   while(($choose_place < 1) || ($choose_place > $num_location));

   for my $i(1..$record_count) {
      if((!(grep(/$match/,$violation[$i])))&& ($i != 0) && ($date[$i] == $sel_year) && ($location[$i] eq $location_name[$choose_place - 1]) && ($statistic[$i] eq "Actual incidents") ) {
         push @searched_crimes, $violation[$i];
         push @unsorted_values, $value[$i];
         $number++;
      }
   }
   my @sorted_values = sort {$b <=> $a} @unsorted_values;

   if (@searched_crimes) {
      print "\n----Top $top_Cnum violations for $location_name[$choose_place - 1] for the year $sel_year----\n";
      for my $k(0..$top_Cnum - 1) {
         for my $j(0..$number - 1) {
            if($sorted_values[$k] == $unsorted_values[$j]) {
               $index = $j;
            }
         }
         print $k+1, ". $searched_crimes[$index]\n";
      }
   }
   else {
      print "\nSORRY, NO DATA AVAILABLE FOR $location_name[$choose_place - 1] FOR $sel_year.\n";
   }
}


#TOP CRIME CITIES
my $year;
my $top_num;
my $select_year;
my $year2;
my @top_cities;
my @city_values;
my $amount = 0;
my $index1;

if($answer3 == 1) {
   if ($topNum == 1) {
      $top_num = 5;
   }
   if ($topNum == 2) {
      $top_num = 10;
   }
   if ($topNum == 3) {
      $top_num = 25;
   }

   do{
      print "\n-----Select the year you wish to view stats for-----\n";
      for my $i(1..18) {
         $year = $i + 1997;
         if($i > 0 && $i < 10) {
            print "$i.  $year\n";
         }else{
            print "$i. $year\n";
         }
      }
      print "Enter selection: ";
      $select_year = <>;
      if(!(looks_like_number($select_year))){
         $select_year = 0;
      }
      if( (grep(/\./, $select_year) ) ){
         $select_year = 0;
      }
      if(($select_year < 1) || ($select_year > 18)) {
         print "YOU HAVE SELECTED AN INVALID YEAR. PLEASE SELECT A YEAR FROM THE LIST.\n";
      }
   }
   while(($select_year < 1) || ($select_year > 18));
   $year2 = $select_year + 1997;
   for my $i(1..$record_count) {
      if(($date[$i] == $year2) && ($violation[$i] eq "Total, all violations") && ($statistic[$i] eq "Actual incidents") && ($location[$i] ne "Canada")) {
         push @top_cities, $location[$i];
         push @city_values, $value[$i];
         $amount++;
      }
   }
   my @sorted_city_values = sort {$b <=> $a} @city_values;
  
   print "\n-----Top $top_num locations with the most crime for $year2-----\n";
   for my $i(0..$top_num - 1) {
      for my $k(0..$amount  - 1) {
         if($sorted_city_values[$i] == $city_values[$k])  {
            $index1 = $k;
         }
      }
      print $i+1, ". $top_cities[$index1]\n";
   }
}

#SAFEST CITIES
my $year5;
my $year6;
my $get_year;
my @safe_cities;
my @safe_values;
my $count = 0;
my $top_num1;
my $index2;

if($answer3 == 3) {
   if ($topNum == 1) {
      $top_num1 = 5;
   }
   if ($topNum == 2) {
      $top_num1 = 10;
   }
   if ($topNum == 3) {
      $top_num1 = 25;
   }

   do{
      print "\n-----Select the year you wish to view stats for-----\n";
      for my $i(1..18) {
         $year5 = $i + 1997;
         if($i > 0 && $i < 10) {
            print "$i.  $year5\n";
         }else{
            print "$i. $year5\n";
         }
      }
      print "Enter selection: ";
      $get_year = <>;
      if(! (looks_like_number($get_year)) ){
         $get_year = 0;
      }
      if( (grep(/\./, $get_year) ) ){
         $get_year = 0;
      }
      if(($get_year < 1) || ($get_year > 18)) {
         print "YOU HAVE SELECTED AN INVALID YEAR. PLEASE SELECT A YEAR FROM THE LIST.\n";
      }
   }
   while(($get_year < 1) || ($get_year > 18));
   $year6 = $get_year + 1997;

   for my $i(1..$record_count) {
      if(($date[$i] == $year6) && ($violation[$i] eq "Total, all violations") && ($statistic[$i] eq "Rate per 100,000 population") && ($location[$i] ne "Canada") && ($value[$i] != 0)) {
         push @safe_cities, $location[$i];
         push @safe_values, $value[$i];
         $count++;
      }
   }
   my @sorted_safe_values = sort {$a <=> $b} @safe_values;

   print "\n-----Top $top_num1 safest cities for the year $year6-----\n";
   for my $i(0..$top_num1 - 1) {
      for my $k(0..$count-1) {
         if($sorted_safe_values[$i] == $safe_values[$k])  {
            $index2 = $k;
         }
      }
      print $i+1, ". $safe_cities[$index2]\n";
   }
}


1;
