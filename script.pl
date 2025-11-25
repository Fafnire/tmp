#!/usr/bin/perl
use strict;
use warnings;
use Sys::Mmap;

my $file = "/home/app-script-ch27/flag.txt";

# 1. Open the file
open my $fh, "<", $file or die "Cannot open $file: $!";

# Get file size (required for mmap)
my $size = -s $fh or die "Cannot stat file: $!";

# 2. mmap() the file
my $addr;
mmap($addr, $size, PROT_READ, MAP_SHARED, $fh, 0)
    or die "mmap failed: $!";

# 3. Read contents directly from memory
print "File contents:\n";
print $addr;

# Unmap and close
munmap($addr);
close $fh;
