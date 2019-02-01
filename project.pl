#!/usr/bin/perl

use strict;
use warnings;
use version;   our $VERSION = qv('5.16.0');
use feature qw/say/;
use autodie;

do "parse.pl";
do "projectinterface.pl";
