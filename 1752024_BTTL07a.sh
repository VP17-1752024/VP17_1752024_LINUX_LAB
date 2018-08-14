#!/bin/bash

list()
{
echo "So luong so cua day so nguyen: $#"
for d in $*; do
    echo $d
    done
}

positive()
{
countPositive=0
for d in $*;do
    if (( d>0 )); then
	echo $d
	(( countPositive++ ))
    fi
    done
echo "So luong so nguyen duong la: $countPositive"
}

negative()
{
countNegative=0
for d in $*; do
   if  (( d<0 )); then
       echo $d
       (( countNegative++ ))
   fi      
done 
echo "So luong so nguyen am: $countNegative"
}

even()
{
evenNumber=0
for d in $*; do
if (( d%2==0 )); then
    echo "$d"
    (( evenNumber++ ))
fi

done
echo "So luong so chan la: $evenNumber "
}

odd()
{
oddNumber=0
for d in $*; do
    if (( d%2!=0 )); then
	echo $d
	(( oddNumber++ ))
    fi
    done
echo "So luong so le la: $oddNumber"
}

prime()
{
    num=0
    while [ $# -gt 0 ]; do
	i=1
	if (( $1 < 2)); then
	shift
    else
	dem=0
	while (( $i <= $1/2 )); do
	if (( $1 % $i == 0 )); then
	    (( dem++ ))
	    (( i++ ))
	else
	    (( i++ ))
	    fi
	done
    fi
    if (( dem < 2 )); then
	echo $1
	((num++))
    fi
    shift
    done
    echo "So luong so nguyen to la: $num "
}

loop()
{
    for d in $*; do
	dem=0
	for i in $*; do
	    if (( d==i )); then
		(( dem++ ))
	    fi
	done
	echo "$d xuat hien $dem lan"
    done
}



list 1 2 3 4 5 6 
echo "==================="
positive -2 -1 1 2 3 4 
echo "==================="
negative -3 -2 -1 1 2 3
echo "==================="
even 2 4 6 7 8 
echo "==================="
odd 1 3 5 6 7 9
echo "==================="
prime 1 2 3 4 5 6 7 10
echo "==================="
loop 1 2 3 1 2 3 1 2 3 4 