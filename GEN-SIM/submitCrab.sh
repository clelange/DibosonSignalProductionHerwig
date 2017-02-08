#!/bin/zsh

EVENTSJOB=200
NJOBS=150
TEMPLATE=crabConfig_MCgeneration.py
DATE=`date +'%F'`

for CONFIG in `ls configs/*.py`; do
  #echo $CONFIG
  CONFIG=`print $CONFIG(:t:r)`
  DATASET=${CONFIG}_GEN-SIM
  CONFIGNAME=crabConfig_${DATASET}.py
  DSBASE=`echo ${CONFIG} | sed 's/\(.*\)-.*/\1/'`
  DSBASE+="/RunIIWinter15wmLHE-MCRUN2_71_V1-v1"
  if [[ "$DSBASE" =~ "M-1000" ]]; then
      DSBASE=`echo ${DSBASE} | sed 's/-v1/-v2/g'`
  fi
  cp $TEMPLATE $CONFIGNAME
  sed -i -e "s/CONFIG/$CONFIG/g" $CONFIGNAME
  sed -i -e "s/DATASET/$DATASET/g" $CONFIGNAME
  sed -i -e "s|DSBASE|$DSBASE|g" $CONFIGNAME
  sed -i -e "s/DATE/$DATE/g" $CONFIGNAME
  sed -i -e "s/EVENTSJOB/$EVENTSJOB/g" $CONFIGNAME
  sed -i -e "s/NJOBS/$NJOBS/g" $CONFIGNAME
  echo crab submit -c $CONFIGNAME
  # break
done
