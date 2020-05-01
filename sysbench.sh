#!/bin/bash

#Install and run sysbench performance testing:
LOG=$(pwd)/$(date +'%m-%d-%Y')-$HOSTNAME-sysbench.log

(

#Install sysbench if we need it:
if [ "" == "`which sysbench`" ]; then 
echo "sysbench not found... installing as dependency."; 
if [ -n "`which apt-get`" ]; then 
apt-get -y install sysbench ; 
elif [ -n "`which yum`" ]; 
then yum -y install sysbench ; 
fi ;
fi


echo "Running cpu tests..."
# CPU
sysbench cpu --time=20 --cpu-max-prime=20000 run
sysbench cpu --time=20 --cpu-max-prime=20000 run --threads=8
echo

echo "Running memory tests..."
#MEMROY
sysbench memory --time=20 --memory-block-size=1K --memory-scope=global --memory-total-size=100G --memory-oper=read run
sysbench memory --time=20 --memory-block-size=1K --memory-scope=global --memory-total-size=100G --memory-oper=write run
echo

echo "Running disk tests..."
#FILE IO
sysbench fileio --file-total-size=10G prepare
sysbench fileio --file-total-size=10G --file-test-mode=rndrw run
sysbench fileio --file-total-size=10G cleanup

cat /proc/cpuinfo
cat /proc/meminfo

) 2>&1 | tee $LOG
