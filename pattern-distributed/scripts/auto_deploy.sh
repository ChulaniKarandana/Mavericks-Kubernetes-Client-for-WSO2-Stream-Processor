#!/bin/bash

args=( "$@" ) 

NUM=${args[0]}

if [ $NUM -eq 1 ];then 
	echo Hey number of workers 1.
	./deploy-1.sh
fi

if [ $NUM -eq 2 ];then
	echo Hey number of workers 2. 
	./deploy-2.sh
fi      

if [ $NUM -eq 3 ];then 
	echo Hey number of workers 3.
	./deploy-3.sh
fi

if [ $NUM -eq 4 ];then
	echo Hey number of workers 4. 
	./deploy-4.sh
fi

if [ $NUM -eq 5 ];then 
	echo Hey number of workers 5.
	./deploy-5.sh
fi

if [ $NUM -eq 6 ];then
	echo Hey number of workers 6. 
	./deploy-6.sh
fi      

if [ $NUM -eq 7 ];then 
	echo Hey number of workers 7.
	./deploy-7.sh
fi

if [ $NUM -eq 8 ];then
	echo Hey number of workers 8. 
	./deploy-8.sh
fi     

if [ $NUM -eq 9 ];then
	echo Hey number of workers 9. 
	./deploy-9.sh
fi  

echo 'Finished'
