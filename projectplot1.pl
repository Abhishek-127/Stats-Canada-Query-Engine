#!/usr/bin/perl
use strict;
use warnings;
use feature qw/say/;
use autodie;
use version;         our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Statistics::R;
use Scalar::Util 'looks_like_number';

my $cmd;
my $pdffilename;
my $graph_type;
our $plotfile;

$plotfile = 'plotfile.csv';
do{
   print "\n------------GRAPH TYPES--------------\n";
   print "Choose your preferred graph type\n1. Line graph\n2. Vertical Bar plot\n3. Horizontal Bar plot\n4. Scatter plot\n";
   print "Enter selection: ";
   $graph_type = <>;
   if(!(looks_like_number($graph_type))){
      $graph_type = 0;
   }
   if( (grep(/\./, $graph_type) ) ){
      $graph_type = 0;
   }
   if($graph_type < 1 || $graph_type > 4){
      print "INVALID INPUT. PLEASE SELECT A NUMBER FROM THE LIST\n";
   }


}
while($graph_type < 1 || $graph_type > 4);
print "Enter the name of the pdf file for the results (i.e outputfile.pdf): ";
$pdffilename = <>;
chomp $pdffilename;

# Create a communication bridge with R and start R
my $R = Statistics::R->new();

# Name the PDF output file for the plot  
#my $Rplots_file = "./Rplots_file.pdf";

# Set up the PDF file for plots
$R->run(qq`pdf("$pdffilename" , paper="letter")`);

if ($graph_type == 1) {
   # Load the plotting library
   $R->run(q`library(ggplot2)`);

   # read in data from a CSV file
   $R->run(qq`data <- read.csv("$plotfile")`);

   # plot the data as a line plot with each point outlined
   $R->run(q`ggplot(data, aes(x=Year, y=Number, colour=Violation, group=Violation)) + geom_line() + geom_point() + ggtitle("Violation Trends Across The Years")`);
}

if ($graph_type == 2) {
   # Load the plotting library
   $R->run(q`library(ggplot2)`);

   # read in data from a CSV file
   $R->run(qq`data <- read.csv("$plotfile")`);

   # plot the data as a line plot with each point outlined
   $R->run(q`ggplot(data=data, aes(x=Year, y=Number, colour=Violation, group=Violation)) + geom_bar(stat="identity") + ggtitle("Violation Trends Across The Years")`);
}

if ($graph_type == 3) {
   # read in data from a CSV file
   $R->run(qq`data <- read.csv("$plotfile")`);

   # plot the data as a line plot with each point outlined
   $R->run(q`barplot(as.integer(data$Number), width = 5, names.arg = data$Year, horiz = TRUE, border = "dark blue", col = "red", las = 1)`);
}

if ($graph_type == 4) {
   # read in data from a CSV file
   $R->run(qq`data <- read.csv("$plotfile")`);

   # plot the data as a line plot with each point outlined
   $R->run(q`plot(data)`);
}

# close down the PDF device
$R->run(q`dev.off()`);

$R->stop();

$cmd = "open $pdffilename";
system($cmd);
