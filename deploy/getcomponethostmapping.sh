#!/bin/bash
if (( $# != 2 )); then
    	echo "Illegal number of parameters"
    	echo "Useage: ./getcomponenthostmapping.sh expfoldername time"
        exit
fi


./getspouteip.sh $1 $2 > comphostmap

#For enc lrb
#comparray=( "accidentdetector" "avgspdtrkr" "pasttollcalc" "segcalc" "spdchkr" "tollcalculator" "vehloctrkr" )
#For lrb
comparray=( "accidentdetector" "avgspdtrkr" "pasttollcalc" "tollcalculator" "vehloctrkr" )
for compname in "${comparray[@]}"; do

./getbolteip.sh $1 $compname $2 >> comphostmap
    
done