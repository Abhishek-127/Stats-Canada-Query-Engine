#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;
use autodie;
no warnings;
use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Text::CSV 1.32;
use Scalar::Util 'looks_like_number';
my $EMPTY = q{};
my $SPACE = q{ };
my $COMMA = q{,};
my $csv          = Text::CSV->new({ sep_char => $COMMA });



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
our $csv          = Text::CSV->new({ sep_char => $COMMA });

require "parse.pl";

my $i=0;
my $count_pop=-1;
my @Geo;
my @Tpc;
my @Char;
my @Prov;
my @Note;
my @Total;
my @Males;
my @Females;
my $file= "PopulationData.CSV";
my $record_count=@location;

my @records1;

open my $names_fh1, '<', $file
or die "Unable to open names file: $file\n";

@records1 = <$names_fh1>;

close $names_fh1 or
die "Unable to close: $file\n";

foreach my $name_record1 ( @records1 ) {
if ( $csv->parse($name_record1) ) {
	my @master_fields = $csv->fields();
        $count_pop++;
	$Geo[$count_pop] = $master_fields[0];
	$Prov[$count_pop] = $master_fields[1];
	$Tpc[$count_pop] = $master_fields[2];
	$Char[$count_pop] = $master_fields[3];
	$Char[$count_pop]=~s/^\s+//;
        $Char[$count_pop] =~ s/\s+$//;
	$Note[$count_pop] = $master_fields[4];
	$Total[$count_pop] = $master_fields[5];
	$Total[$count_pop]=~s/^\s+//;
	$Males[$count_pop] = $master_fields[7];
	$Females[$count_pop] = $master_fields[9];
	} else {
	   warn "Line/record could not be parsed: $count_pop $records1[$count_pop]\n";
	}
}


my @cities;
my $cities_count=0;
my $j=0;
my $t=0;
my $answer;
my $answerCity=0;

$count_pop=@Geo;
for($i=0;$i<$count_pop;$i++)
{
   if($Prov[$i] ne $Prov[$i+1])
   {
	$cities[$cities_count++]=$Prov[$i];
   }
}
$cities_count=@cities;
$i=0;
do{
   print "\n---------2011 CENSUS STATISTICS--------\n";
   print "1. Population statistics for a particular province\n";
   print "2. Population by age characteristics\n";
   print "3. Safest location for children\n";
   print "4. Most unsafe location for women\n";
   print "5. Most common and uncommon languages in a Province (Other than English and French)\n";
   print "6. Know the percentage of people that speak a language in each Province\n";
   print "7. Back\nYour Answer: ";

   $answer=<>;
   print "\n";
   if(!(looks_like_number($answer))){
    $answer = 0;
   }
   if( (grep(/\./, $answer) ) ){
     $answer = 0;
   }
   if($answer < 1 || $answer > 7){
    print "\nINVALID INPUT. PLEASE SELECT A NUMBER FROM THE LIST\n";
   }
}
while($answer < 1 || $answer > 7);
while($answer != 7)
{
   if($answer == 1)
   {
        $i=0; $t=0; $j=1;
        print "Select a Province by its number:\n";
        for($j=0;$j<$cities_count;++$j)
        {
                print $j+1;
		print ". ";
		print "$cities[$j]\n";
        }
        print "Your answer: ";
        $answerCity=<>;
        if(! (looks_like_number($answerCity))){
          $answerCity = 0;
        }
        if( (grep(/\./, $answerCity) ) ){
          $answerCity = 0;
        }
        $answerCity=$answerCity-1;
        while($answerCity<0 || $answerCity>13 )
        {
           print "\n\nInvalid Input! Try Again\n";
           $i=0; $t=0; $j=1;
           print "Select a Province by its number:\n";
           for($j=0;$j<$cities_count;++$j)
           {
                print $j+1;
                print ". ";
                print "$cities[$j]\n";
           }
           print "Your answer:";
           $answerCity=<>;
           if( !(looks_like_number($answerCity))){
            $answerCity = 0;
           }
           if( (grep(/\./, $answerCity) ) ){
            $answerCity = 0;
           }
           $answerCity=$answerCity-1;
        }
        print "\nProvince Selected: $cities[$answerCity]\n";
        for($t=0; $t<$count_pop; $t++)
        {
                if($Prov[$t] eq $cities[$answerCity])
                {
                        if($Tpc[$t] eq "Population and dwelling counts")
                        {
                                print "$Char[$t] \nValue: $Total[$t] $Males[$t] $Females[$t]\n";
                        }
                }
        }
    }

   if($answer==2)
   {
        print "Select a Province by its number:\n";
        for($j=0;$j<$cities_count;++$j)
        {
                print $j+1;
                print ". ";
                print "$cities[$j]\n";
        }
        print "Your answer: ";
        $answerCity=<>;
        if(!(looks_like_number($answerCity)) ){
          $answerCity = 0;
        }
        if( (grep(/\./, $answerCity) ) ){
          $answerCity = 0;
        }
        $answerCity=$answerCity-1;
        while($answerCity<0 or $answerCity>13)
        {
           print "\nInvalid Input! Try Again\n";
           $i=0; $t=0; $j=1;
           print "Select a Province by its number:\n";
           for($j=0;$j<$cities_count;++$j)
           {
                print $j+1;
                print ". ";
                print "$cities[$j]\n";
           }
           print "Your answer:";
           $answerCity=<>;
           if(!(looks_like_number($answerCity))){
            $answerCity = 0;
           }
           if( (grep(/\./, $answerCity) ) ){
            $answerCity = 0;
           }
           $answerCity=$answerCity-1;
        }
        print "\nProvince Selected: $cities[$answerCity]\n";
        for($t=0; $t<$count_pop; $t++)
        {
                if($Prov[$t] eq $cities[$answerCity])
                {
                        if(($Tpc[$t] eq "Age characteristics") and ($Char[$t] ne  "   15 to 19 years"))
                        {
                                if($Char[$t] eq "Total population by age groups")
                                {
                                        print "$Char[$t]\t$Total[$t]\t$Males[$t]\t$Females[$t]\n"
                                }
                                else
                                {
                                        print "$Char[$t]\t\t\t$Total[$t]\t$Males[$t]\t$Females[$t]\n"
                                }
                        }
                }
        }
   }
   if($answer==3)
   {
      my @BabyCrimes;
      my @BabyPop;
      my $count=0;
      for($t=0;$t<$count_pop;$t++)
      {
         if($Char[$t] eq "0 to 4 years")
         {
            $BabyPop[$count++]=$Total[$t];
         }
      }
      for($t=0;$t<$cities_count;$t++)
      {
         for($i=0;$i<$record_count;$i++)
         {
            if($cities[$t] eq $location[$i])
            {
               if(($violation[$i] eq "Infanticide") or ($violation[$i] eq "Total sexual violations against children") or ($violation[$i]eq "Parent or guardian procuring sexual activity") or ($violation[$i] eq "Luring a child via a computer") or $violation[$i] eq "Total sexual violations against children")
               {
                  if($statistic[$i] eq "Actual incidents" and $date[$i] eq "2011")
                  {
                     $BabyCrimes[$t]=$BabyCrimes[$t]+$value[$i];
                  }
               }
            }
         }
      }
      $t=0;
      my $BabyCapital=0;my $BabyIndex=0; my $MostSafe=0;
      for($t=0;$t<$cities_count;$t++)
      {
         $BabyPop[$t]=$BabyCrimes[$t]/$BabyPop[$t];
      }
      for($t=1;$t<$cities_count;$t++)
      {
         if($BabyPop[$t]>$BabyCapital)
         {
            $BabyCapital=$BabyPop[$t];
            $BabyIndex=$t;
         }
      }
      $BabyCapital=10000000;
      for($t=1;$t<$cities_count;$t++)
      {
         if($BabyPop[$t]<$BabyCapital)
         {
            $BabyCapital=$BabyPop[$t];
            $MostSafe=$t;
         }
      }  
      print "Children are most safe in the Province(According to 2011): $cities[$MostSafe]\n";
      print "Children are most unsafe in the Province(According to 2011): $cities[$BabyIndex]\n";
   }

   if($answer==4)
   {
      my @WomenCrimes;
      my @WomenPop;
      my $counter=0;
      for($t=0;$t<$count_pop;$t++)
      {
         if($Char[$t] eq "Total population by age groups")
         {
            $WomenPop[$counter++]=$Females[$t];
         }
      }
      for($t=0;$t<$cities_count;$t++)
      {
         for($i=0;$i<$record_count;$i++)
         {
            if($cities[$t] eq $location[$i])
            {
               if(($violation[$i] eq "Sexual assault, level 3, aggravated") or ($violation[$i] eq "Sexual assault, level 3, aggravated") or ($violation[$i] eq "Sexual assault, level 2, weapon or bodily harm")  or ($violation[$i] eq "Sexual assault, level 3, aggravated") or ($violation[$i] eq "Sexual assault, level 1") or ($violation[$i] eq "Sexual interference") or ($violation[$i] eq "Invitation to sexual touching") or ($violation[$i] eq "Sexual exploitation") or ($violation[$i] eq "") )
               {
                  if($statistic[$i] eq "Actual incidents" and $date[$i] eq "2011")
                  {
                     $WomenCrimes[$t]=$WomenCrimes[$t]+$value[$i];
                  }
               }
            }
         }
      }
      $t=0;my $SafeWomenIndex=0;
      my $WomenCapital=0;my $WomenIndex=0;
      for($t=0;$t<$cities_count;$t++)
      {
         $WomenPop[$t]=$WomenCrimes[$t]/$WomenPop[$t];
      }
      for($t=1;$t<$cities_count;$t++)
      {
         if($WomenPop[$t]>$WomenCapital)
         {
            $WomenCapital=$WomenPop[$t];
            $WomenIndex=$t;
         }
      }
      $WomenCapital=100000;
      for($t=1;$t<$cities_count;$t++)
      {
         if($WomenPop[$t]<$WomenCapital)
         {
            $WomenCapital=$WomenPop[$t];
            $SafeWomenIndex=$t;
         }
      }
      print "Women are most safe in the Province: $cities[$SafeWomenIndex]\n";
      print "Women are most unsafe in the Province: $cities[$WomenIndex]\n";
   }
   if($answer==5)
   {
      my $MostIndex=0;
      my $LeastIndex=0;
      my $MostValue=0; my $LeastValue=11111110000000000000;
      $i=0;my $counterPrint=0;
      print "Select a Province by its number\n";
      for($i=0;$i<$cities_count;$i++)
      {
         print $i+1;
         print ". $cities[$i]\n";
      }
      print "Your answer: ";
      $answerCity=<>;
      if(!(looks_like_number($answerCity))){
        $answerCity = 0;
      }
      if( (grep(/\./, $answerCity) ) ){
          $answerCity = 0;
      }
      $answerCity=$answerCity-1;
      while($answerCity<0 or $answerCity>13)
        {
           print "\n\nInvalid Input! Try Again\n";
           $i=0; $t=0; $j=1;
           print "Select a Province by its number:\n";
           for($j=0;$j<$cities_count;++$j)
           {
                print $j+1;
                print ". ";
                print "$cities[$j]\n";
           }
           print "Your answer:";
           $answerCity=<>;
           if(!(looks_like_number($answerCity))){
            $answerCity = 0;
           }
           if( (grep(/\./, $answerCity) ) ){
            $answerCity = 0;
           }
           $answerCity=$answerCity-1;
        }
      for($t=0; $t<$count_pop; $t++)
        {
                if($Prov[$t] eq $cities[$answerCity])
                {
                        if($Tpc[$t] eq "Detailed mother tongue")
                        {
                           if($Char[$t] ne "Single responses" and $Char[$t] ne "Detailed mother tongue - Total population excluding institutional residents" and $Char[$t] ne "Single responses" and $Char[$t] ne "English" and $Char[$t] ne "French" and $Char[$t] ne "Non-official languages" and $Char[$t] ne "Selected Aboriginal languages" and $Char[$t] ne "Selected non-Aboriginal languages" and $Char[$t] ne "Other languages" and $Char[$t] ne "Multiple responses" and $Char[$t] ne "English and French" and $Char[$t] ne "English and non-official language" and $Char[$t] ne "French and non-official language" and $Char[$t] ne "English, French and non-official language")
                           {
                              if($Total[$t]==0)
                              {
                                 if($counterPrint==0)
                                 {
                                    print "\nLanguages never spoken(Zero people speaking that language):\n";
                                 }
                                 $counterPrint++;
                                 print "$Char[$t]\n";
                              }
                              if($Total[$t] <$LeastValue)
                              { 
                                 $LeastValue=$Total[$t]; $LeastIndex=$t;
                              }
                              if($Total[$t] >$MostValue)
                              {
                                 $MostValue=$Total[$t]; $MostIndex=$t;
                              }

                           }
                        }
                }
         }
         print "\nLeast common mother tongue in $cities[$answerCity]: $Char[$LeastIndex]\n";
         print "Most common mother tongue in $cities[$answerCity]: $Char[$MostIndex]\n";
      
   }
   if($answer==6)
   {
      my $found=0;
      print "Enter a language: ";
      my $answerLan=<>;
      chomp($answerLan);
      my $Popu=0;
      for($t=0;$t<$cities_count;$t++)
      {
         for($i=0;$i<$count_pop;$i++)
         {
           if($cities[$t] eq $Prov[$i])
           {
                 if($Char[$i] eq "Population in 2011")
                 {
                    $Popu=$Total[$i];
                 }
                 if(grep(/\b$Char[$i]\b/i,$answerLan))
                 {
                    if($Tpc[$i] eq "Detailed mother tongue")
                    {
                       $found=1;
                       my $pertage=$Total[$i]/$Popu;
                       $pertage=$pertage*100;
                       $pertage=sprintf "%.2f", $pertage;
                       print "In $cities[$t], $answerLan is the mother tongue of $pertage% of the population.\n";
                    }
                }
           } 
         }
      }
      if($found==0)
      {
         print "Sorry! Languange $answerLan is not found. \n"
      }
   }
   do{
    print "\n\n---------2011 CENSUS STATISTICS--------\n";
    print "1. Population statistics for a particular province\n";
    print "2. Population by age characteristics\n";
    print "3. Safest location for children\n";
    print "4. Most unsafe location for women\n";
    print "5. Most common and uncommon languages in a Province (Other than English and French)\n";
    print "6. Know the percentage of people that speak a language in each Province\n";
    print "7. Back\nYour Answer: ";
    $answer=<>;
    print "\n";
    if(!(looks_like_number($answer))){
      $answer = 0;
    }
    if($answer < 1 || $answer > 7){
      print "\nINVALID INPUT. PLEASE SELECT A NUMBER FROM THE LIST\n";
    }
 }
 while($answer < 1 || $answer > 7);
}
