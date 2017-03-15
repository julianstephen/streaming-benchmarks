#!/bin/bash

source env.sh
now=$(date +"%m_%d_%Y_%HH_%MM_%SS")
fname=workers
cmdfname="torun-${now}.sh"
FOLDERTODELETE=$1

CMD="rm -rf ${FOLDERTODELETE}/*"
#CMD="ls ${FOLDERTODELETE}"
DIR="$( cd "$( dirname "$0" )" && pwd )" 

read -p "Will delete all data in ${FOLDERTODELETE} Folder in all slave nodes. Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Will delete ${FOLDERTODELETE} folder data Now!"
    echo "#!/bin/bash" > "${cmdfname}" 
    echo "${CMD}" >> "${cmdfname}"

    eval $CMD
    cat  $fname  | while IFS='' read -r line || [ -n "$line" ] 
	do
	    scp "${cmdfname}"  ${line}:${DIR}/
    	ssh -n -f ${line} 'sh '"${DIR}/${cmdfname}" 
	done    
	echo 'Clean Local Folders..'   
	eval $CMD

fi

