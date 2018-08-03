#! /bin/bash
flag_help=false
flag_find=false
flag_count=false
flag_add=false
flag_del=false

showHelp() 
{
echo "[-h|--help]/[-f|--find]/[-c|--count]/[-a|--add]/[-d|-delete] input.txt"
}

find()
{
echo -n "Nhap tu can tim: "
read a 
while read line; do
for i in $line; do
    if [[$i == $a ]]; then
	echo $line
    return 
    fi
done
done <input.txt
}

count()
{
    i=0
    echo -n "So muc: "
    while read line; do
	(( i++ ))
    done<input.txt
    echo $i
}

add()
{
    echo "Nhap thong tin danh ba can them: "
    echo -n "Last name: "
    read ho
    echo -n "First name: "
    read ten
    echo -n "Phone: "
    read sdt
    echo -n "Email: "
    echo "Last Name: $ho ; First Name: $ten ; Phone: $sdt; Email: $email">>input.txt
}

delete()
{
    echo -n "Nhap ten muc can xoa: "
    read name
    touch temp.txt
    cp input.txt  temp.txt
    mark=0
    while read line; do
	(( mark++ ))
	for i in $line; do
	    if [[ $i == $name ]]; then
		break
	    fi
	done
	done <input.txt
    i=0
    while read line; do
	mark=$(( mark-1 ))
	if (( mark>0 )); then
	    (( i++ ))
	    if (( i==1 )); then
		echo $line >input.txt
		else
		echo $line >>input.txt
		fi
	    fi
	done <temp.txt
    rm temp.txt
    echo "Danh ba da duoc cap nhat!"
}

case $1 in
    -h|--help) flag_help=true
	shift
	;;
    -f|--find) flag_find=true
	shift
	;;
    -c|--count) flag_count=true
	shift
	;;
    -a|--add) flag_add=true
	shift
	;;
    -d|--delete) flag_del=true
	shift
	;;
*) echo "Khong co gi"
exit 1
;;
esac

showInfos()
{
    if $flag_help; then
        echo $(showhelp)
    fi
    if $flag_find; then
    find $*
    fi
    if $flag_count; then
    count $*
    fi
    if $flag_add; then
    add $*
    fi
    if $flag_del; then
    delete $*
    fi
}

readFile()
{
if test -e $2; then
showInfos $2
else
echo "File khong ton tai"
exit 1 
fi
}

process()
{
local input="$2"
readFile $input
}
process $input