#!/usr/bin/env bash

source $WORK/Project_GaN/ENVIRONMENT_VARIABLES
echo "BIN_DIR:" $BIN_DIR
echo "PSEUDO_DIR:" $PSEUDO_DIR
echo "TMP_DIR:" $TMP_DIR
echo "Parallel command:" $RUN_COMMAND
echo "Started at: " `date`

SCF=N_to_C.scf.in


for klist in \
"2 2 2" \
"3 3 2" \
"4 4 2" 
do

kx=$(echo $klist | awk '{print $1}')
ky=$(echo $klist | awk '{print $2}')
kz=$(echo $klist | awk '{print $3}')

echo "K-grid = $kx x $ky x $kz"

IN=script$kx$ky$kz.scf.in
OUT=script$kx$ky$kz.scf.out


sed -e "s/^2 2 2 0 0 0/$kx $ky $kz 0 0 0/" $SCF > $IN
COMMAND="  $RUN_COMMAND $BIN_DIR/pw.x"
echo -e "\t\t$COMMAND < $IN > $OUT"
$COMMAND < $IN > $OUT



done


echo "Finished at: " `date`

