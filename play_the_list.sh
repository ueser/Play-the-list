#!bin/bash

mapfile -t playlist < $1

num_lines=$(wc -l < "$1")
echo ${num_lines}
for i in $(seq 1 ${num_lines});
do
	echo "processing: $i"
	idx=$((RANDOM % ${num_lines}))
	echo "the idx is ${idx}"
	
	IFS=';' read -ra ADDR <<< "${playlist[idx]}"
	name=${ADDR[0]}
	echo "name is ${name}"

	link=${ADDR[1]}
	echo "link is ${link}"	

	echo "Playing ${name} ..."
	cvlc --no-video --play-and-exit ${link}
done

