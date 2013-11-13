##################################################################
####            Minecraft Server Backup Script               #####
####            Script Author: Dennis Diehm                  #####
####            Script Version: 1.4.2.2                      #####
#### 		Script Name: backup161.sh                    #####
#### 		Description: Backing up some MC-related data #####
##################################################################
#!/bin/bash

NAME="Minecraft-164-Filebackup"
SUFFIX="tar.gz"
DATE=`date +"%d-%m-%Y"`
FULLNAME="$NAME-$DATE.$SUFFIX"
SQLNAME="Minecraft-SQLBackup"
SQLSUFFIX="sql"
FULLSQLNAME1="$SQLNAME-$DATE-AuthMe.$SQLSUFFIX"
FULLSQLNAME2="$SQLNAME-$DATE-CoreProtect2.$SQLSUFFIX"
FULLSQLNAME3="$SQLNAME-$DATE-LWC2.$SQLSUFFIX"
FULLSQLNAME4="$SQLNAME-$DATE-mcMMO2.$SQLSUFFIX"
FULLSQLNAME5="$SQLNAME-$DATE-craftconomy.$SQLSUFFIX"

echo -e "\e[0;91m Staring Backup Script, please wait"

sleep 2


echo -e "\e[0;91m Switching to Servers Directory"

cd /home/gameserver/survival_164

sleep 2

echo -e "\e[0;96m Dumping MySQL Database (AuthMe)" 
sleep 1
mysqldump -uroot -pAlbertWesker23 AuthMe > $FULLSQLNAME1
echo -e "\e[0;96m Dumping MySQL Database (CoreProtect)" 
sleep 1
mysqldump -uroot -pAlbertWesker23 CoreProtect2 > $FULLSQLNAME2
echo -e "\e[0;96m Dumping MySQL Database (LWC2)" 
sleep 1
mysqldump -uroot -pAlbertWesker23 LWC2 > $FULLSQLNAME3
echo -e "\e[0;96m Dumping MySQL Database (mcMMO2)" 
sleep 1
mysqldump -uroot -pAlbertWesker23 craftconomy > $FULLSQLNAME5
echo -e "\e[0;96m Dumping MySQL Database (craftconomy)" 
sleep 1
mysqldump -uroot -pAlbertWesker23 mcmmo2 > $FULLSQLNAME5

sleep 2

cd /home/gameserver/survival_164

echo -e "\e[0;91m Creating Archive of MC Server"

tar czfv $FULLNAME /home/gameserver/survival_164

sleep 2

echo -e "\e[0;91m Done."

sleep 1

echo -e "\e[0;91m Connecting to FTP Server and storing Data Files"

sleep 1

ftp -inv 144.76.107.9 << EOF
user backup-mc 1011_DEU
put $FULLNAME
put $FULLSQLNAME1
put $FULLSQLNAME2
put $FULLSQLNAME2
put $FULLSQLNAME4
put $FULLSQLNAME5
put $FULLSQLNAME6

bye
EOF

sleep 2 

echo -e "\e[0;91m Deleting Temporary Files from FS"

rm -f $FULLNAME
cd /home/gameserver/survival_164
rm -f $FULLSQLNAME1
rm -f $FULLSQLNAME2
rm -f $FULLSQLNAME3
rm -f $FULLSQLNAME4
rm -f $FULLSQLNAME5
rm -f $FULLSQLNAME6
rm -f $FULLSQLNAME7

sleep 2

echo -e ""
echo -e "\e[0;96m Finished."

exit 0
