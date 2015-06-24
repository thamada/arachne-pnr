#!/bin/bash

set -ex

arachne_pnr=../../bin/arachne-pnr

# sb_up3down5.blif
$arachne_pnr sb_up3down5.blif -o sb_up3down5.txt
icepack sb_up3down5.txt sb_up3down5.bin

$arachne_pnr -l sb_up3down5.blif -o sb_up3down5_l.txt
icepack sb_up3down5_l.txt sb_up3down5_l.bin

$arachne_pnr sb_up3down5.blif -B sb_up3down5_packed.blif -o sb_up3down5.txt
$arachne_pnr sb_up3down5_packed.blif -o sb_up3down5_packed.txt
icepack sb_up3down5_packed.txt sb_up3down5_packed.bin


$arachne_pnr carry.blif -o carry.txt
icepack carry.txt carry.bin

$arachne_pnr bram.blif -o bram.txt
icepack bram.txt bram.bin

# FIXME don't overwrite
# test 8k
$arachne_pnr -d 8k sb_up3down5.blif -o sb_up3down5.txt
icepack sb_up3down5.txt sb_up3down5.bin

$arachne_pnr -d 8k  -l sb_up3down5.blif -o sb_up3down5_l.txt
icepack sb_up3down5_l.txt sb_up3down5_l.bin

$arachne_pnr -d 8k  sb_up3down5.blif -B sb_up3down5_packed.blif -o sb_up3down5.txt
$arachne_pnr -d 8k  sb_up3down5_packed.blif -o sb_up3down5_packed.txt
icepack sb_up3down5_packed.txt sb_up3down5_packed.bin


$arachne_pnr -d 8k  carry.blif -o carry.txt
icepack carry.txt carry.bin

$arachne_pnr -d 8k  bram.blif -o bram.txt
icepack bram.txt bram.bin