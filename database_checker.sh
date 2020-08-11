#!/bin/bash
FILES=$(cat ./.files | grep "./databases/")

for FILE in $FILES; do
	DATABASE=$(echo ${FILE} | sed -e 's/.\/databases\///g' | sed -e 's/.txt//g' )
	
	if [ -f ${FILE} ]; then
		echo "[${DATABASE}] Status ==> 'OK'"
		sleep 1
	else
		echo "[${DATABASE}] Status ==> 'Undefined'"
		sleep 1
		echo "Baixando o banco de dados [${DATABASE}]"
		sleep 1
	fi
done
