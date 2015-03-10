#!/bin/bash
# Makes some example data to play around with in the Intro to Shell workshop

gen_len=100      # size of line in genome data
gen_lines=50     # number of lines in genome data
nii_bytes=$((1024*1024))  # size of imaging files

mkdir -p data
for i in S{000..100}; do 
  subject_dir=data/$i
  mkdir -p $subject_dir

  #
  # genome data
  #
  if [ $(($RANDOM % 100)) -gt 90 ]; then   # 10% of the time
    lines=$((gen_lines - 10))   # truncate file
  else
    lines=$gen_lines
  fi

    
  tr -cd 'ACTG' < /dev/urandom | fold -w $gen_len | \
    head -$lines > $subject_dir/genome.dat

  #
  # imaging data
  #
  if [ $(($RANDOM % 100)) -gt 80 ]; then   # 20% of the time
    bytes=$(($nii_bytes - 1090))   # truncate file
  else
    bytes=$nii_bytes
  fi
  fold -w $bytes < /dev/urandom | head > $subject_dir/T1.nii

  # zip the file, sometimes 
  if [ $(($RANDOM % 100)) -gt 70 ]; then
    gzip $subject_dir/T1.nii
  fi


  #
  # demographic data
  (
  # age
  if [ $(($RANDOM % 100)) -gt 50 ]; then
    echo "F"
  elif [ $(($RANDOM % 100)) -gt 5 ]; then
    echo "M"
  else
    echo ""   # unknown 
  fi
  for j in {0..10}; do
    echo $(($RANDOM % 100))
  done
  ) | paste -s -d"," > $subject_dir/demographics.csv
done
