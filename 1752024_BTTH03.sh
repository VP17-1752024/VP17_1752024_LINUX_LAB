#! /bin/bash

echo -n "Nhap duong dan: "
read file
while ! test -e $file;
do
	echo -n "Nhap sai! Nhap lai: "
	read file;
done

echo -n "Ban co muon xoa noi dung file? (y/n): "
read ans
if [ $ans == "y" ];
then
	rm -r * $file;
else
	echo "Thu muc duoc giu nguyen.";
fi

mkdir BTTL
mkdir BTTH
cd BTTL
mkdir BTTL{1,2,3,4,5,6,7,8,9}
cd ../BTTH
mkdir BTTH{1,2,3,4,5,6,7,8,9}
touch BTTH{1,2,3,4,5,6,7,8,9}/1752024.sh
chmod u+x BTTH[1-9]/1752024.sh
echo "
#==============================
#Ho ten: Nguyen Anh Khoi
#MSSV: 1752024
#Ma bai tap: BTTH03
#=============================">BTTH1/1752024.sh;
ls BTTH[1-9]

cd ../BTTL
touch BTTL{1,2,3,4,5,6,7,8,9}/1752024.sh
chmod u+x BTTL[1-9]/1752024.sh

ls BTTL[1-9]
echo "#=========================
#Ho ten: Nguyen Anh Khoi
#MSSV: 1752024
#Ma bai tap: BTTH03
#=========================">BTTL1/1752024.sh
cd BTTL1
cat 1752024.sh
./1752024.sh
echo "Thu muc da duoc tao xong!"
