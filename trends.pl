#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;
use autodie;
use warnings;
use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Scalar::Util 'looks_like_number';

require "parse.pl";

my $location_ans;
my @crimes;
my $crime_ans;
our $plotfile;
our $graph_ans;
our $trendans;
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

$plotfile = 'plotfile.csv';

@crimes = ('Homicide', 'Murder, First Degree', 'Murder, Second Degree', 'Manslaughter', 'Sexual exploitation', 'Attempted murder', 'Sexual assault, level 3, aggravated', 'Sexual assault, level 2, weapon or bodily harm', 'Total robbery', 'Total abduction');

if ($trendans == 1) {
   print "\n------Total violations in Canada over the years-----\n";
   print "Year    Number of violations\n";
   for my $i (0..$record_count) {
      if (($location[$i] eq "Canada") && ($violation[$i] eq "Total, all violations") && ($statistic[$i] eq "Actual incidents")) {
         print "$date[$i]    $value[$i]\n";
      }
   }
   print "\n";
}

if ($trendans == 2) {
   do {
      print "\n-----Choose from the list of locations below-----\n";
      for my $i(0..$num_location) {
         if ($i != $num_location) {
            print $i+1, ". $location_name[$i]\n";
         }
      }
      print "Enter selection: ";
      $location_ans = <>;
      if( !(looks_like_number($location_ans))){
         $location_ans = 0;
      }
      if( (grep(/\./, $location_ans) ) ){
         $location_ans = 0;
      }
      if(($location_ans < 1) || ($location_ans > $num_location)) {
         print "YOU HAVE SELECTED AN INVALID LOCATION. PLEASE SELECT A LOCATION FROM THE LIST.\n";
      }
   }
   while (($location_ans < 1) || ($location_ans > $num_location));
   print "\n-----Total violations in $location_name[$location_ans - 1] over the years-----\n";
   print "Year    Number of violations\n";
   for my $j(0..$record_count) {
      if(($location[$j] eq $location_name[$location_ans - 1]) && ($violation[$j] eq "Total, all violations") && ($statistic[$j] eq "Actual incidents")) {
         print "$date[$j]    $value[$j]\n";
      }
   }
   print "\n";
}
 
if ($trendans == 3) {
   do {
      print "\n-----Choose from the list of violations below-----\n";
      for my $i (0..10) {
         if($i != 10) {
            print $i+1, ". $crimes[$i]\n";
         }
      }
      print "Enter selection: ";
      $crime_ans = <>;
      if( !(looks_like_number($crime_ans))){
         $crime_ans = 0;
      }
      if( (grep(/\./, $crime_ans) ) ){
         $crime_ans = 0;
      }
      if (($crime_ans < 1) || ($crime_ans > 10)) {
         print "YOU HAVE SELECTED AN INVALID VIOLATION. PLEASE SELECT A VIOLATION FROM THE LIST.\n";
      }
   }
   while (($crime_ans < 1) || ($crime_ans > 10));
   print "\n-----Total occurences of $crimes[$crime_ans - 1] over the years-----\n";
   print "Year    Total number of occurences\n";
   for my $j (0..$record_count) {
      if(($location[$j] eq "Canada") && ($violation[$j] eq $crimes[$crime_ans - 1]) && ($statistic[$j] eq "Actual incidents")) {
         print "$date[$j]    $value[$j]\n";
      }
   }
   print "\n";   
}

if (($trendans > 0) && ($trendans < 4)) {
   do {
      print "Would you like to view the results as a graph?\n1. Yes\n2. No\n";
      print "Enter selection: ";
      $graph_ans = <>;
      if(!(looks_like_number($graph_ans))){
         $graph_ans = 0;
      }
      if( (grep(/\./, $graph_ans) ) ){
         $graph_ans = 0;
      }
      print "\n";
      if (($graph_ans != 1) && ($graph_ans != 2)) {
         print "PLEASE SELECT AN OPTION FROM THE LIST\n";
      }
   }
   while (($graph_ans != 1) && ($graph_ans != 2));
}  

if ($graph_ans == 1) {
   if ($trendans == 1) {
      open (my $LOG, '>>', $plotfile);
      select $LOG;
      truncate $plotfile, 0;

      print "\"Violation\",\"Year\",\"Number\"\n";
      for my $i (0..$record_count) {
         if(($location[$i] eq "Canada") && ($violation[$i] eq "Total, all violations") && ($statistic[$i] eq "Actual incidents")) {
            print "\"Total Violations in Canada\",$date[$i],$value[$i]\n";
         }
      }
      select STDOUT;
      do "projectplot1.pl";
   }
   if ($trendans == 2) {
      open (my $LOG, '>>', $plotfile);
      select $LOG;
      truncate $plotfile, 0;

      print "\"Violation\",\"Year\",\"Number\"\n";
      for my $i (0..$record_count) {
         if(($location[$i] eq $location_name[$location_ans - 1]) && ($violation[$i] eq "Total, all violations") && ($statistic[$i] eq "Actual incidents")) {
            print "\"Total Violations in $location[$i]\",$date[$i],$value[$i]\n";
         }
      }
      select STDOUT;
      do "projectplot1.pl";
   }
   if ($trendans == 3) {
      open (my $LOG, '>>', $plotfile);
      select $LOG;
      truncate $plotfile, 0;

      print "\"Violation\",\"Year\",\"Number\"\n";
      for my $i (0..$record_count) {
         if (($location[$i] eq "Canada") && ($violation[$i] eq $crimes[$crime_ans - 1]) && ($statistic[$i] eq "Actual incidents")){
            print "\"Total Occurences of $violation[$i]\",$date[$i],$value[$i]\n";
         }
      }
      select STDOUT;
      do "projectplot1.pl";
   }
}  

1;
