while true; do
echo -n `/home/dustin/.xmonad/scripts/volumebar.sh`
echo -n ' '
echo -n `/home/dustin/.xmonad/scripts/batterybar.sh`
echo -n ' |'
echo -n "^fg(grey)" `date`
echo -n ' | '
echo -n `/home/dustin/.xmonad/scripts/dateOffset.sh`
echo -n ' | '
echo  `/home/dustin/.xmonad/scripts/music_status.sh`
sleep 0.5
done
