#!/usr/bin/perl -w

$ROWS=50*1024*1024;
open F, ">/tmp/hash1.txt" or die;
for ($i=0; $i<$ROWS; $i++) {
    printf F "%d\n", int(rand($ROWS));
}
close F or die;

#$ROWS=40*1024*1024;
open F, ">/tmp/hash2.txt" or die;
for ($i=0; $i<$ROWS; $i++) {
    $s="";
    for (1..20) { $s .= chr(ord('a')+int(rand(26))); }
    print F $s, "\n";
}
close F or die;

