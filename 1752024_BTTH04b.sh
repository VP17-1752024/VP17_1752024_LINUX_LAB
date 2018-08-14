#! /bin/bash

flag_countline=false
flag_find=false
flag_all=false

showHelp ()
{ 
    
    echo "$0 [-h|--help][-a|--all][-f|--find filename][-c|--count
filename][dir]"
}


while [ $# -ge 1 ]; do
    
    case $1 in
        -h|--help) showHelp
	          shift
	          ;;
	-a|--all) flag_all=true
	    shift
	    ;;
	-f|--find) flag_find=true
	    filename="$1"
	    shift
	    ;;
	-c|--count) flag_countline=true
	    shift
	    ;;
	*) echo "khong gi ca" 
	    exit 1
    esac
done


showAllFiles ()
{
    if [ -d $1 ]
    then
	files="$1/*"
	for file in $files
	do
	    echo ${file##*/}
	done
    else
	echo "Duong dan khong ton tai"
	exit
    fi
}
findFile ()
{
    local dir="$1"
    local filename="$2"
    for d in $dir/*; do
	fname=${d##*/}
	if [ "$fname"="$filename" ]; then
	    echo "$d"
	fi
    done

}

countLines ()
{
    local dir="$1"
    if ! [ -f $dir ]; then
	echo "Khong ton tai"
	exit 1
    elif ! [ -r $dir ]; then
	    echo "Khong co quyen doc"
    else
	echo "${dir##*/}"
        echo $( wc -l < $dir )
    fi
}


showInfos ()
{
    if $flag_countline; then
	echo "$(countLines /home/akn174/Documents/test1)"
    fi
    if $flag_find; then
	echo "$(findFile /home/akn174/Documents/text)"
    fi
    if $flag_all; then
	echo "$(showAllFiles /etc)"
    fi
}

showInfos
