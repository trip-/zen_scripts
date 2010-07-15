#! /bin/bash
FILE=$2

f_c(){
	gpg --output $FILE.gpg --symmetric $FILE
}

f_d(){
	gpg --output ${FILE/%.gpg/} --decrypt $FILE
}

case "$1" in
'c' | 'crypt')
	f_c
	;;
'd' | 'decrypt' )
	f_d
	;;
*)
	echo "Uso: $0 {c|d} filename"
	;;
esac
