#!/usr/bin/perl
#
#   Packages and modules
#
use strict;
use warnings;
use feature qw/say/;
use autodie;
no warnings;
use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Text::CSV  1.32;   # We will be using the CSV module (version 1.32 or higher)
                       # to parse each line

#
#   Variables to be used
#
my $EMPTY = q{};
my $SPACE = q{ };
my $COMMA = q{,};

my $filename     = $EMPTY;
my @records;
our $record_count = -1;
our $num_location = 0;
our @location_name;
our @date;
our @location;
our @violation;
our @statistic;
our @vector;
our @coordinate;
our @value;
our $csv          = Text::CSV->new({ sep_char => $COMMA });


$filename = 'ProjectData.csv';
open my $names_fh, '<', $filename
   or die "Unable to open names file: $filename\n";

@records = <$names_fh>;

close $names_fh or
   die "Unable to close: $filename\n"; 

foreach my $name_record ( @records ) {
   #$record_count++;
   if ( $csv->parse($name_record) ) {
      my @master_fields = $csv->fields();
      $record_count++;
      $date[$record_count] = $master_fields[0];
      $location[$record_count] = $master_fields[1];
      $violation[$record_count] = $master_fields[2];
      $statistic[$record_count] = $master_fields[3];
      $vector[$record_count] = $master_fields[4];
      $coordinate[$record_count] = $master_fields[5]; 
      $value[$record_count] = $master_fields[6];
      if(($location[$record_count] ne $location[$record_count - 1]) && $record_count != 0) {
         push @location_name, $location[$record_count];
         $num_location++;
      }
   }else {
      warn "Line/record could not be parsed: number $record_count  $records[$record_count]\n";
   }
}

1;
