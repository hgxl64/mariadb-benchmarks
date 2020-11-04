#!/bin/bash

for d in t_*
do 
  cd $d
  ./collect.pl
  cd ..
done

