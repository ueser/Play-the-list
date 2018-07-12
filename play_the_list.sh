#!bin/bash

mapfile -t playlist < $1

num_lines=$(wc -l < "$1")
echo ${num_lines}
for i in $(seq 1 ${num_lines});
do
	idx=$((RANDOM % ${num_lines}))
	
	IFS=';' read -ra ADDR <<< "${playlist[idx]}"
	name=${ADDR[0]}

	link=${ADDR[1]}

	echo "Playing ${name} ..."
	cvlc --no-video --play-and-exit ${link}
done

