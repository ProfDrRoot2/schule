##################################################
# Scipt Author: 	Dennis Diehm 		 #
# Script Version:	0.8 pre release		 #
# Script descr:		Starting all Gameservers #
# Copyright by:		Prof. Dr. Root		 #
##################################################

#!/bin/bash

echo -e "Starting up all Gameservers"

echo -e ""

echo -e "Starting up Survival 1.6.4"

cd /home/gameserver/survival_164 && screen -A -m -d -S survival_164 java -Xincgc -Xmx20G -jar spigot-1.6.4-R0.1-SNAPSHOT.jar -o false

PIDJAVA="pidof java"

echo -e "Minecraft Survival was successfully started with PID $PIDJAVA"

echo -e ""

echo -e "Starting up all Killing Floor Gameservers"

sleep 1

cd /home/gameserver/KF_1/System && screen -A -m -d -S KF_1 ./ucc-bin server KF-BioticsLab.rom?gameKFmod.KFGameType?VACSecured=true?MaxPlayers=6?AdminName=ProfDrRoot?AdminPassword=1011_DeU?multihome=144.76.14.189 -nohomedir ini=KillingFloor.ini

echo -e ""
echo -e "Killing Floor Server (KF_1) started!"

sleep 1

cd /home/gameserver/KF_2/System && screen -A -m -d -S KF_2 ./ucc-bin server KF-BioticsLab.rom?gameKFmod.KFGameType?VACSecured=true?MaxPlayers=6?AdminName=ProfDrRoot?AdminPassword=1011_DeU?multihome=144.76.14.189 -nohomedir ini=KillingFloor.ini

echo -e ""
echo -e "Killing Floor Server (KF_2) started!"

sleep 1

cd /home/gameserver/KF_3/System && screen -A -m -d -S KF_3 ./ucc-bin server KF-BioticsLab.rom?gameKFmod.KFGameType?VACSecured=true?MaxPlayers=6?AdminName=ProfDrRoot?AdminPassword=1011_DeU?multihome=144.76.14.189 -nohomedir ini=KillingFloor.ini

echo -e ""
echo -e "Killing Floor Server (KF_3) started!"

sleep 1

cd /home/gameserver/KF_4/System && screen -A -m -d -S KF_4 ./ucc-bin server KF-BioticsLab.rom?gameKFmod.KFGameType?VACSecured=true?MaxPlayers=6?AdminName=ProfDrRoot?AdminPassword=1011_DeU?multihome=144.76.14.189 -nohomedir ini=KillingFloor.ini

echo -e ""
echo -e "Killing Floor Server (KF_4) started!"

sleep 1

cd /home/gameserver/KF_5/System && screen -A -m -d -S KF_5 ./ucc-bin server KF-BioticsLab.rom?gameKFmod.KFGameType?VACSecured=true?MaxPlayers=6?AdminName=ProfDrRoot?AdminPassword=1011_DeU?multihome=144.76.14.189 -nohomedir ini=KillingFloor.ini

echo -e ""
echo -e "Killing Floor Server (KF_5) started!"

PIDKF="pidof ucc-bin-real"

sleep 1

echo -e "Killing Floor Gameservers are successfully started with PID $PIDKF"

echo -e ""
