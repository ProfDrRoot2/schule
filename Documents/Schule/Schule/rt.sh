echo "Set Realtime for srcds"

PIDS=`pidof srcds_linux`
for p in $PIDS; do
  chrt -p 99 -r $p
  renice -20 $p
done

sleep 1

echo ""
echo "Set Realtime for ucc-bin-real"

sleep 1

PIDS=`pidof ucc-bin-real`
for p in $PIDS; do
  chrt -r -p 99 $p
  renice -20 $p
done

echo ""
echo "Set Realtime for Java"

sleep 1

PIDS=`pidof java`
for p in $PIDS; do
  chrt -r -p 99 $p
  renice -20 $p
done

