for I in `cat br_hostnames3.txt`
do
	let LENGTH=${#I}-1
	echo ${I:0:$LENGTH}
done
